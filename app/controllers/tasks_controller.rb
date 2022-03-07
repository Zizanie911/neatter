class TasksController < ApplicationController
  def index
    @tasks = policy_scope(Task).today
    @user = current_user
    @username = @user.username
    @total = nb_total_tasks
    @nb_habits_not_done = @tasks.habits.not_done.count
    @nb_tasks_not_done = @tasks.regular_tasks.not_done.count
    @estimated_time = estimated_time
    @regular_tasks = regular_tasks
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = Task.new(task_params)

    if task_params[:days].present?
      first_day = task_params[:days].first.to_i
      @task.start_at = Date.today.beginning_of_week + ((first_day > 0 ? first_day : 7) - 1).days
      @task.user = current_user
      authorize @task
      if @task.valid?
        task_params[:days].map(&:to_i).each do |i|
          task = Task.new(task_params)
          task.start_at = Date.today.beginning_of_week + ((i > 0 ? i : 7) - 1).days
          task.user = current_user
          task.save
        end
        redirect_to tasks_path
      else
        render :new
      end

    else
      @task.start_at = Date.today unless task_params[:start_at].present?
      @task.user = current_user
      authorize @task
      if @task.save
        redirect_to tasks_path
      else
        render :new
      end
    end
  end

  def edit
    @task = Task.find(params[:id])
    authorize @task
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    authorize @task
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    authorize @task
    redirect_to tasks_path
  end

  def mark_as_done
    @task = Task.find(params[:id])
    authorize @task
    @task.mark_as_done = !@task.mark_as_done
    @task.save

    redirect_to tasks_path
  end

  # def duplicate_to_next_day
  #   copie = task.clone
  #   copie.user = current_user
  #   copie.save
  # end

# a corriger :
  def tasks_of_the_day
    current_user.tasks.where(start_at: Date.today)
  end

  private

  def task_params
    params.require(:task).permit(:name, :details, :priority, :start_at, :duration, days:[])
  end

  def regular_tasks
    @tasks.where(days: nil)
  end

  def habits
    @tasks.where.not(days: nil)
  end

  def nb_total_tasks
    @tasks.count
  end

  def nb_tasks
    regular_tasks.count
  end

  def nb_habits
    habits.count
  end

  def estimated_time
    t = 0
    @tasks.not_done.each do |task|
      t += task.duration unless task.duration.nil?
    end
    return "00:00" if t.zero?

    if t >= 60
      h = t.modulo(60)
      mn = t - (h * 60)
      return "#{h}:00" if mn.zero?

      return "#{h}:#{mn}"
    end
    return "00:#{t}"
  end
end
