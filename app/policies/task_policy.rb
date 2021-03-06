class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all
      # For a multi-tenant SaaS app, you may want to use:
      scope.where(user: user)
    end
  end

  def create?
    return true
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
    return true
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end

  def mark_as_done?
    record.user == user
  end

  def prioritize?
    record.user == user
  end
end
