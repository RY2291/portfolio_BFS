FactoryBot.define do
  factory :user do
    name { Faker::Lorem.chracters(number: 5) }
    email { Faker::Internet.email}
    introduction{ Faker::Lorem.chracters(number: 20) }
    password { "password" }
    password_confirmation { "password" }
  end
end