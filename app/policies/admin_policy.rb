class AdminPolicy < ApplicationPolicy

  def dashboard?
    @user&.role == "admin"
  end
end