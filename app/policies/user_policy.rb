class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def calendar?
    true
  end

  def share_calendar?
    true
  end
end
