FactoryBot.define do
  if UserType.all.empty? then UserType.create(name: "Admin") end
  factory :admin, class: :user do
    first_name { "Admin" }
    last_name { "Adminson" }
    user_type_id { 1 }
    password { "password" }
    password_confirmation { |u| u.password }
    sequence(:email) { |n| "admin#{n}@testemail.com" }
  end
end
