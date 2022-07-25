class Admin::ArticlesPolicy < ApplicationPolicy

  def show?
    true
  end

  def index?
    true
  end

  def new?
    false
  end

  def create?
    new?
  end

  def edit?
    false
  end

  def update?
    edit?
  end

  def destroy?
    false
  end


end