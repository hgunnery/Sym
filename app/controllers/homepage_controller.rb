class HomepageController < ApplicationController

  def index
    #simple check to make sure that there are users otherwise re-direct to initial_setup
    if User.first.nil? then
      redirect_to initial_setup_path
    end
  end

  def initial_setup
    ## TODO: move into seperate controller?
    @user = User.new
  end
end
