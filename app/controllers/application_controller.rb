class ApplicationController < ActionController::Base
  include Passwordless::ControllerHelpers
  include Pundit::Authorization

  helper_method :current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    @current_user ||= authenticate_by_session(User)
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

  # def require_user!
  #   return if current_user
  #   redirect_to root_path, flash: { error: 'You are not worthy!' }
  # end
end