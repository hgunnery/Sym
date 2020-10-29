class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]
	before_action :require_login, only: [:show, :edit, :update]

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
		@user = User.find(params[:user_id]) #Sending this back throguh to the new form
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
		@subscription = nil
		@user = User.find(params[:subscription][:user_id])
    #Check which type of subscription it is
    if subscription_params[:payment_gateway] == "stripe"
      prepare_new_subscription
			respond_to do |format|
	      if @subscription.save_with_stripe_payment
	        format.html { redirect_to root_path, notice: 'Subscription was successfully created.' }
	        format.json { render :show, status: :created, location: @subscription }
	      else
	        format.html { render :new }
	        format.json { render json: @subscription.errors, status: :unprocessable_entity }
	      end
	    end

    elsif subscription_params[:payment_gateway] == "paypal"
      #PAYPAL WILL BE HANDLED HERE
    end
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
		# dont want to destroy the subscription but set status to canceled and send the cancelation off to stripe/paypal

    # @subscription.destroy
    # respond_to do |format|
    #   format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end


  private

		def prepare_new_subscription
	    @subscription = Subscription.new(subscription_params)
			@user = User.find(params[:subscription][:user_id])
	    @subscription.user_id = @user.id
	    @supporter_level = SupporterLevel.find(params[:subscription][:supporter_level_id])
	    @subscription.price = @supporter_level.ammount
	  end

    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subscription_params
      params.require(:subscription).permit(:user_id, :supporter_level_id, :status, :token, :price, :payment_gateway, :customer_id, :charge_id, :error_message)
    end
end
