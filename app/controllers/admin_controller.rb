class AdminController < ApplicationController

  def dashboard
    authorize :admin, :dashboard?
  end

end
