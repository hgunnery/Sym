class SuggestionsController < ApplicationController
	before_action :require_login
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy, :completed, :incomplete]

  # GET /suggestions
  # GET /suggestions.json
  def index
		@suggestions = Suggestion.where(completed: false, banned: false).order(vote_count: :desc).limit(5)
		@page_title = "Top 5 Suggestions"
  end

  # GET /suggestions/1
  # GET /suggestions/1.json
  def show
  end

  # GET /suggestions/new
  def new
    @suggestion = Suggestion.new
  end

  # GET /suggestions/1/edit
  def edit
  end

  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = Suggestion.new(suggestion_params)
		@suggestion.user = current_user
		if current_user.is_admin? then
			@suggestion.admin_suggested = true
		end

    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to @suggestion, notice: 'Suggestion created' }
        format.json { render :show, status: :created, location: @suggestion }
      else
        format.html { render :new }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggestions/1
  # PATCH/PUT /suggestions/1.json
  def update
    respond_to do |format|
      if @suggestion.update(suggestion_params)
        format.html { redirect_to @suggestion, notice: 'Suggestion updated' }
        format.json { render :show, status: :ok, location: @suggestion }
      else
        format.html { render :edit }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggestions/1
  # DELETE /suggestions/1.json
  def destroy
    @suggestion.destroy
    respond_to do |format|
      format.html { redirect_to suggestions_url, notice: 'Suggestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	def completed
		@suggestion.completed = true
		@suggestion.save!
		redirect_to suggestions_path, notice: "Suggestion marked as completed"
	end

	def incomplete
		@suggestion.completed = false
		@suggestion.save!
		redirect_to suggestions_path, notice: "Suggestion marked as incomplete"
	end

	def all_banned
		@suggestions = Suggestion.where(completed: false, banned: true).order(created_at: :desc)
		@page_title = "Banned Suggestions"
		respond_to do |format|
        format.js
    end
	end

	def all_completed
		@suggestions = Suggestion.where(completed: true, banned: false).order(created_at: :desc)
		@page_title = "All Completed Suggestions"
		respond_to do |format|
        format.js
    end
	end

	def all_suggested
		@suggestions = Suggestion.where(completed: false, banned: false).order(created_at: :desc)
		@page_title = "All Suggestions"
		respond_to do |format|
        format.js
    end
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggestion
      @suggestion = Suggestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def suggestion_params
      params.require(:suggestion).permit(:name, :description, :banned, :banned_reason)
    end
end
