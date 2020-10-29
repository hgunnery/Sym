FactoryBot.define do
  factory :subscription do
    user_id { 1 }
    supporter_level_id { 1 }
    status { 1 }
    token { "MyString" }
    price { "9.99" }
    payment_gateway { 1 }
    customer_id { "MyString" }
    charge_id { "MyString" }
    error_message { "MyString" }
  end
end
