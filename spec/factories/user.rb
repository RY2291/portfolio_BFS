FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 5) }
    email { Faker::Internet.email}
    introduction{ Faker::Lorem.characters(number: 20) }
    password { "password" }
    password_confirmation { "password" }
  end
  
  factory :user_1, class: "User" do
    name { "ユーザー" }
    email { "test@example.com" }
    introduction {"aaaaaaa"}
    password { "password" }
    password_confirmation { "password" }
  end
end