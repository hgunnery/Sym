class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

	def require_login
    unless current_user
      flash[:error] = "You need to be logged in to get to that page."
      redirect_to root_path
    end
  end

	def admins_only
    unless current_user && current_user.is_admin?
      flash[:error] = "You need to be an admin to get to that page."
      redirect_to root_path
    end
  end

  helper_method :current_user, :require_login, :admins_only

end
