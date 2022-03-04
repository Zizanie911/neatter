class NextdayController < ApplicationController
  def review
    @tasks = policy_scope(Task)
  end

  def reset
    # TODO
    # 1/ Itérer sur les mark_as_done_task_ids de params
    raise
    @tasks =
    # 2/ Itérer sur les postpone_task_ids de params et les cloner avec comme start_date le lendemain
    redirect_to review_path
  end
end
