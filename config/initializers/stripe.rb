Rails.application.configure do
  config.stripe.secret_key = Rails.application.credentials.stripe[:secret_key]
  config.stripe.publishable_key = Rails.application.credentials.stripe[:publishable_key]
end
