FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyText" }
    published { false }
    published_at { "2020-09-29 11:04:21" }
  end
end
