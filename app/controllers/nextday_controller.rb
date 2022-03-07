class NextdayController < ApplicationController
  def review
    @tasks = policy_scope(Task)
    @postponed = false
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
          start_at: task.start_at + 1.day
        )
        copy.user = current_user
        copy.save!
      end
    end

    # Next day : check ! Now index page displays the day after

    @user = current_user
    @day = @user.days.where(today: Date.today).first_or_initialize
    @day.passed = true
    @day.save!

    redirect_to profile_path
  end
end
