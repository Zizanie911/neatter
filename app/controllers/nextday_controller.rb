class NextdayController < ApplicationController
  def review
    @tasks = policy_scope(Task)
  end

  def reset
    raise

    # TODO

    redirect_to review_path
  end
end
