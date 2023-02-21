class JobPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create
    @user.has_role?(:admin) || @user.has_role?(:company)
  end

  def show?
    (@user && @record.user_id == @user.id) || (@user && @user.has_role?(:admin))
  end

  def update?
    @record.user == @user
  end

  def destroy?
    # ver como usar o user has_hole ou algum jeito pra esse current_user.admin
    @record.user == @user || @user.has_role?(:admin)
  end
end
