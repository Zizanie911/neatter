class DashboardController < ApplicationController
  def profile
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
end

 # @monday = @tasks_week.map { |task| task if task.start_at.monday? }
    # @tuesday = @tasks_week.map { |task| task if task.start_at.tuesday? }
    # @wednesday = @tasks_week.map { |task| task if task.start_at.wednesday? }
    # @thursday = @tasks_week.map { |task| task if task.start_at.thursday? }
    # @friday = @tasks_week.map { |task| task if task.start_at.friday? }
    # @saturday = @tasks_week.map { |task| task if task.start_at.saturday? }
    # @sunday = @tasks_week.map { |task| task if task.start_at.sunday? }

    # @monday = @tasks_week.select { |task| task.start_at.monday? }
    # @tuesday = @tasks_week.select { |task| task.start_at.tuesday? }
    # @wednesday = @tasks_week.select { |task| task.start_at.wednesday? }
    # @thursday = @tasks_week.select { |task| task.start_at.thursday? }
    # @friday = @tasks_week.select { |task| task.start_at.friday? }
    # @saturday = @tasks_week.select { |task| task.start_at.saturday? }
    # @sunday = @tasks_week.select { |task| task.start_at.sunday? }

    # @tasks_per_day = @tasks_week.group_by { |task| task.start_at.to_date }

    # @tasks_per_day.each do |task_per_day|
    #   @hash_value_tasks[:task_per_day.value].each do {
    #     number_of_tasks: task_per_day.count,
    #     num_of_finish_tasks: task_per_day.where(mark_as_done: true),
    #     opacity_pourcentage: @num_of_finish_tasks.fdiv(number_of_tasks)
    #     }
    #   end
    # end

# @number_tasks_day = @tasks_per_day.count
    # @tasks_done_per_day = @tasks_per_day.where(mark_as_done: true)



    # {
    #   <Date Mon, 28 Feb 2022> => [
    #     #<Task id: 2, user_...>,
    #     #<Task id: 3, user_...>,
    #   ],
    #   <Date Tue, 01 Mar 2022> => [
    #     #<Task id: 4, user_...>
    #   ]
    # }



    # @days.each do |day|
    #   @hash_value_tasks[:day] = {
    #     tasks_day: policy_scope(Task).where("start_at.strftime('%w').to_i == ?", day),
    #     number_of_tasks: @tasks_day.count,
    #     num_of_finish_tasks: policy_scope(Task).where(mark_as_done: true),
    #     opacity_pourcentage: @num_of_finish_tasks.fdiv(number_of_tasks)
    #   }
    # end

    #@hash_opacity_value = {}
    #@days_abbr.each do |day_abbr|
      # day_abbr: @hash_value_tasks[day_abbr][opacity_pourcentage]
    #end
