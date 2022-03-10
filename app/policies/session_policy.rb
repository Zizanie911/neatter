class SessionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all
      # For a multi-tenant SaaS app, you may want to use:
      scope.where(session: current_user.session)
    end
  end

  def yesterday?
    record.user == user
  end

end
