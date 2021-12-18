FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 5) }
    introduction { Faker::Lorem.characters(number: 20) }
    address { "東京都渋谷区富ヶ谷1-49-3" }
    association :user
  end
end