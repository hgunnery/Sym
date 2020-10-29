class Subscriptions::Stripe
  INVALID_STRIPE_OPERATION = 'Invalid Stripe Operation'
  def self.execute(subscription:, user:)
    supporter_level = subscription.supporter_level
    # Check if the subscription is a plan
    if supporter_level.stripe_plan_name.blank?
      charge = self.execute_charge(ammount: supporter_level.ammount,
                                   description: supporter_level.name,
                                   card_token:  subscription.token)
    else
  	 #SUBSCRIPTIONS WILL BE HANDLED HERE
    end

    unless charge&.id.blank?
      # If there is a charge with id, set subscription paid.
      subscription.charge_id = charge.id
      subscription.set_paid
    end
  rescue Stripe::StripeError => e
    # If a Stripe error is raised from the API,
    # set status failed and an error message
    subscription.error_message = INVALID_STRIPE_OPERATION
    subscription.set_failed
  end
  private
  def self.execute_charge(ammount:, description:, card_token:)
    Stripe::Charge.create({
      amount: ammount.to_s,
      currency: "gbp",
      description: description,
      source: card_token
    })
  end
end
