class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

	# Setting stripe and paypal codes to ba accessible via a variaple so that the presense can be checked (shorthand) across the app easily to stop code running when it doesnt need to
	def stripe_codes
		@stripe_codes = Rails.application.credentials.stripe if Rails.application.credentials.stripe
	end

	def paypal_codes
		@paypal_codes = Rails.application.credentials.paypal if Rails.application.credentials.paypal
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
