class Admin::SupporterLevelsController < ApplicationController
	before_action :admins_only
  before_action :set_supporter_level, only: [:show, :edit, :update, :destroy]

  # GET /supporter_levels
  # GET /supporter_levels.json
  def index
    @supporter_levels = SupporterLevel.all
  end

  # GET /supporter_levels/1
  # GET /supporter_levels/1.json
  def show
  end

  # GET /supporter_levels/new
  def new
    @supporter_level = SupporterLevel.new
  end

  # GET /supporter_levels/1/edit
  def edit
  end

  # POST /supporter_levels
  # POST /supporter_levels.json
  def create
    @supporter_level = SupporterLevel.new(supporter_level_params)

    respond_to do |format|
      if @supporter_level.save
        format.html { redirect_to admin_homepage_path, notice: 'Supporter level was successfully created.' }
        format.json { render :show, status: :created, location: @supporter_level }
      else
        format.html { render :new }
        format.json { render json: @supporter_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supporter_levels/1
  # PATCH/PUT /supporter_levels/1.json
  def update
    respond_to do |format|
      if @supporter_level.update(supporter_level_params)
        format.html { redirect_to @supporter_level, notice: 'Supporter level was successfully updated.' }
        format.json { render :show, status: :ok, location: @supporter_level }
      else
        format.html { render :edit }
        format.json { render json: @supporter_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supporter_levels/1
  # DELETE /supporter_levels/1.json
  def destroy
    @supporter_level.destroy
    respond_to do |format|
      format.html { redirect_to admin_homepage_path, notice: 'Supporter level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supporter_level
      @supporter_level = SupporterLevel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def supporter_level_params
      params.require(:supporter_level).permit(:name, :ammount, :description, rewards: [])
    end
end
