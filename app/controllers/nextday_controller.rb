class NextdayController < ApplicationController
  def review
    @tasks = policy_scope(Task)
  end
end
