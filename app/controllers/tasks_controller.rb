class TasksController < ApplicationController
  def index
    @tasks = policy_scope(Task)
    @user = current_user
    @username = @user.username
    @total = nb_total_tasks
    @nb_habits = nb_habits
    @nb_tasks = nb_tasks
    @estimated_time = estimated_time
    @regular_tasks = regular_tasks
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    authorize @task
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def mark_as_done
    @task = Task.find(params[:id])
    authorize @task
    @task.mark_as_done = !@task.mark_as_done
    @task.save
    redirect_to tasks_path
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
    @tasks.each do |task|
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
