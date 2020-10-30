FactoryBot.define do
  factory :admin, class: :user do
    first_name { "Admin" }
    last_name { "Adminson" }
    user_type { "admin" }
    password { "password" }
    password_confirmation { |u| u.password }
    sequence(:email) { |n| "admin#{n}@testemail.com" }
  end
end

FactoryBot.define do
  factory :supporter, class: :user do
    first_name { "Supporter" }
    last_name { "Supporterson" }
    user_type { "supporter" }
    password { "password" }
    password_confirmation { |u| u.password }
    sequence(:email) { |n| "supporter#{n}@testemail.com" }
  end
end
