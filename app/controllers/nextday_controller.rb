class NextdayController < ApplicationController
  def review
    @tasks = policy_scope(Task)
  end

  def reset
    # TODO
    # 1/ Itérer sur les mark_as_done_task_ids de params
    @tasks = Task.find(params[:mark_as_done_task_ids])
    # a changer !!!!!!
    puts "params[:mark_as_done_task_ids] = #{params[:mark_as_done_task_ids]}"
    Task.all.each do |task|
      puts "task.id = #{task.id}"
      if params[:mark_as_done_task_ids].include?(task.id.to_s)
        puts "PREMIERE CONDITION $$$$$$$$$$$$$$$$$$$$$$$"
        task.mark_as_done = true
        puts "task.mark_as_done = #{task.mark_as_done}"
      else
        puts "DEUXIEME CONDITION $$$$$$$$$$$$$$$$$$$$$$$"
        task.mark_as_done = false
      end
      task.save
    end
    # 2/ Itérer sur les postpone_task_ids de params et les cloner avec comme start_date le lendemain
    # raise
    redirect_to review_path
  end
end
