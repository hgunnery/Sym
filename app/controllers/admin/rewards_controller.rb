class Admin::RewardsController < ApplicationController
	before_action :admins_only

	def index
		@supporter_levels = SupporterLevel.all.order(ammount: :desc)
	end

	def new
		@supporter_levels = SupporterLevel.all
	end

	def create
		slids = params[:post][:supporter_level_id]
		slids.each do |slid|
			unless slid.empty? then
				supporter_level = SupporterLevel.find(slid)
				# Rails.logger.warn "Supporter Level #{supporter_level.name} #{slid}"
				if params[:post][:rewards].present?
		      params[:post][:rewards].each do |reward|
		        supporter_level.rewards.attach(reward)
		      end
		    end
			end
		end

		redirect_to admin_rewards_path, notice: 'Rewards have been added!'
	end
end
