class UserPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.admin?
  end

  def create?
    user.admin?
  end

  def show?
    true
  end

  def update?
    user.admin? || user == @record
  end

  def destroy?
    user.admin?
  end
end
