class Admin::HomepageController < ApplicationController

  def index
    if current_user && current_user.is_admin? then

    else
      redirect_to root_url, :error => "Only admins allowed here!"
    end
  end

  def initial_setup
    ## TODO: move into seperate controller?
    @user = User.new
    @user.user_type_id = 1
  end
end
