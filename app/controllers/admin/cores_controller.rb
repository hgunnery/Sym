class Admin::CoresController < ApplicationController
	before_action :admins_only
  before_action :set_core, only: [:show, :edit, :update]


  # GET /cores/1
  # GET /cores/1.json
  def show
		@supporter_levels = SupporterLevel.all
  end

  # GET /cores/1/edit
  def edit
  end

  # POST /cores
  # POST /cores.json
  def create
    @core = Core.new(core_params)

    respond_to do |format|
      if @core.save
        format.html { redirect_to @core, notice: 'Core was successfully created.' }
        format.json { render :show, status: :created, location: @core }
      else
        format.html { render :new }
        format.json { render json: @core.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cores/1
  # PATCH/PUT /cores/1.json
  def update
    respond_to do |format|
      if @core.update(core_params)
        format.html { redirect_to admin_core_path(@core), notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @core }
      else
        format.html { render :edit }
        format.json { render json: @core.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core
      @core = Core.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def core_params
      params.require(:core).permit(:homepage_title, :homepage_content, :banner, :homepage_about, :avatar, :sm_youtube, :sm_twitter, :sm_facebook, :sm_instagram, :sm_youtube_link, :sm_twitter_link, :sm_facebook_link, :sm_instagram_link)
    end
end
