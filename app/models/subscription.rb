class Subscription < ApplicationRecord
	enum status: { pending: 0, failed: 1, paid: 2, paypal_executed: 3}
  enum payment_gateway: { stripe: 0, paypal: 1 }
  belongs_to :supporter_level
  belongs_to :user

  scope :recently_created, ->  { where(created_at: 1.minutes.ago..DateTime.now) }

  def set_paid
    self.status = Subscription.statuses[:paid]
  end

  def set_failed
    self.status = Subscription.statuses[:failed]
  end

  def set_paypal_executed
    self.status = Subscription.statuses[:paypal_executed]
  end

	def save_with_stripe_payment
    if valid?
			@user = self.user
			@supporter_level = self.supporter_level
      customer = Stripe::Customer.create(description: @user.email, plan: @supporter_level.stripe_plan_name, card: token)
      self.token = customer.id
			self.set_paid
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end
