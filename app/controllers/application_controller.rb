class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  after_action :verify_authorized, unless: :devise_controller?

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform the requested action."
    redirect_back(fallback_location: root_path)
  end
end
