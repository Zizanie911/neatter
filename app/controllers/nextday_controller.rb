class NextdayController < ApplicationController
  def review
    @tasks = policy_scope(Task)
  end

  def reset
    # TODO
    puts "plop"
    redirect_to review_path
  end
end
