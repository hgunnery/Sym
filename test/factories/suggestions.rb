FactoryBot.define do
  factory :suggestion do
    name { "MyString" }
    description { "MyText" }
    votes { 1 }
    completed { false }
    banned { false }
		banned_reason { "" }
    admin_suggested { false }
  end
end
