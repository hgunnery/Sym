class Admin::HomepageController < ApplicationController
	before_action :admins_only

  def index
    @supporter_levels = SupporterLevel.all
  end
end
