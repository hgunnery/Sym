class VotesController < ApplicationController
	before_action :find_suggestion
	before_action :find_vote, only: [:destroy]

	def create
		if already_voted?
			flash[:notice] = "You can't vote more than once"
		else
			@suggestion.votes.create(user_id: current_user.id)
			@suggestion.vote_count = @suggestion.vote_count + 1
			@suggestion.save!
		end
    redirect_to suggestions_path
  end

	def destroy
	  if !(already_voted?)
	    flash[:notice] = "Cannot remove vote"
	  else
	    @vote.destroy
			@suggestion.vote_count = @suggestion.vote_count - 1
			@suggestion.save!
	  end
		redirect_back(fallback_location: suggestions_path)
	end

  private

	def find_vote
	   @vote = @suggestion.votes.find(params[:id])
	end

	def already_voted?
	  Vote.where(user_id: current_user.id, suggestion_id: params[:suggestion_id]).exists?
	end

  def find_suggestion
    @suggestion = Suggestion.find(params[:suggestion_id])
  end

end
