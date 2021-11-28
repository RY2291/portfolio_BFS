FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 5) }
    introduction { Faker::Lorem.characters(number: 20) }
    address { Faker::Lorem.characters(number: 15) }
    association :user
  end
end