class NextdayController < ApplicationController
  def review
    @username = current_user.username
    @tasks = policy_scope(Task)
    @postponed = false

    @user = current_user
    @days_abbr = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    @days = [0, 1, 2, 3, 4, 5, 6]
    @hash_value_tasks = {}
    @day = Date.today.beginning_of_week
    @week_days = (0...7).map { |i| Date.today.beginning_of_week + i.days }
    @tasks = policy_scope(Task).past
    @tasks_week = policy_scope(Task).past.this_week.order(:start_at)
    @username = current_user.username


    @total_tasks_per_week = current_user.tasks.group_by_week(:start_at).count

    # Variable pour calculer les taches totales tasks et habits par mois
    start_date = Date.today.at_beginning_of_month
    end_date = Date.today.at_beginning_of_month.next_month - 1.days

    @month_days = (start_date..end_date)

    # tout le monde : tâches et habits
    @total_tasks_per_day = current_user.tasks.group_by_day(:start_at).count
    @done_tasks_per_day = current_user.tasks.where(mark_as_done: true).group_by_day(:start_at).count


    @opacity_coeff = @total_tasks_per_day.map do |date, counter|
      [date, @done_tasks_per_day[date].to_i == 0 ? 0 : @done_tasks_per_day[date].to_i.fdiv(counter)]
    end.to_h

    # les tâches seules
    @total_tasks_only_per_day = current_user.tasks.where(days: nil).group_by_day(:start_at).count
    @done_tasks_only_per_day = current_user.tasks.where(days: nil).where(mark_as_done: true).group_by_day(:start_at).count

    @opacity_coeff_tasks = @total_tasks_only_per_day.map do |date, counter|
      [date, @done_tasks_only_per_day[date].to_i == 0 ? 0 : @done_tasks_only_per_day[date].to_i.fdiv(counter)]
    end.to_h

    # les habits seules
    @total_habits_only_per_day = current_user.tasks.where.not(days: nil).group_by_day(:start_at).count
    @done_habits_only_per_day = current_user.tasks.where.not(days: nil).where(mark_as_done: true).group_by_day(:start_at).count
    @opacity_coeff_habits = @total_habits_only_per_day.map do |date, counter|
      [date, @done_habits_only_per_day[date].to_i == 0 ? 0 : @done_habits_only_per_day[date].to_i.fdiv(counter)]
    end.to_h
  end

  def reset
    # TODO
    # 1/ Itérer sur les mark_as_done_task_ids de params
    unless params[:mark_as_done_task_ids].nil?
      Task.today.all.each do |task|
        if params[:mark_as_done_task_ids].include?(task.id.to_s)
          task.mark_as_done = true
        else
          task.mark_as_done = false
        end
        task.save
      end
    end
    # 2/ Itérer sur les postpone_task_ids de params et les cloner avec comme start_date le lendemain
    unless params[:postpone_task_ids].nil?
      @tasks = Task.today.find(params[:postpone_task_ids])

      @tasks.each do |task|
        # task.duplicate_to_next_day :
        copy = Task.new(
          name: task.name,
          details: task.details,
          priority: task.priority,
          start_at: params[:postpone_task_date][task.id.to_s]
        )
        copy.user = current_user
        copy.save!
      end
    end

    # Next day : check ! Now index page displays the day after

    @user = current_user
    @session = @user.sessions.where(today: Date.today).first_or_initialize
    @session.passed = true
    @session.save!

    redirect_to tasks_path
  end

  def display_yesterday
    @session = @user.sessions.where(today: Date.today).first_or_initialize
    @session.passed = false
    @session.save!

    redirect_to tasks_path
  end
end
