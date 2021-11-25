FactoryBot.define do
  factory :post do
    title { Faker::Lorem.chracters(number: 5) }
    introduction { Faker::Lorem.chracters(number: 20) }
    address { Faker::Lorem.chracters(number: 15) }
    association :user
  end
end