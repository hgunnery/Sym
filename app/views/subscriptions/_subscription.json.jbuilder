json.extract! subscription, :id, :user_id, :supporter_level_id, :status, :token, :price, :payment_gateway, :customer_id, :charge_id, :error_message, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
