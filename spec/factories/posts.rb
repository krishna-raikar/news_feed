FactoryBot.define do
  factory :post do
    content Faker::Lorem.word
    association :user
  end
end
