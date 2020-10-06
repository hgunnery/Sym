FactoryBot.define do
  factory :suggestion do
    name { "MyString" }
    description { "MyText" }
    completed { false }
    banned { false }
		banned_reason { "" }
    admin_suggested { false }
  end
end
