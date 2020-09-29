class HomepageController < ApplicationController
	before_action :require_login, only: [:dashboard, :blog]

	def new
		@user = User.new
	end

  def index
    #simple check to make sure that there are users otherwise re-direct to initial_setup
    if User.first.nil? then
      redirect_to initial_setup_path
    end
		if current_user && current_user.is_admin? then
			redirect_to admin_homepage_path
		elsif current_user && current_user.is_supporter? then
			redirect_to dashboard_path
		else
			#currently do nothing
		end
  end

  def initial_setup
    ## TODO: move into seperate controller?
    @user = User.new
  end

	def dashboard

	end

	def blog
		@posts = Post.where(published: true).order(published_at: :desc)
	end
end
