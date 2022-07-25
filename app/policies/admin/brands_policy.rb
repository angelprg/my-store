class Admin::BrandsPolicy < ApplicationPolicy

  def show?
    @user&.role == "admin"
  end

  def index?
    @user&.role == "admin"
  end

  def new?
    @user&.role == "admin"
  end

  def create?
    new?
  end

  def edit?
    @user&.role == "admin"
  end

  def update?
    edit?
  end

  def destroy?
    @user&.role == "admin"
  end
end