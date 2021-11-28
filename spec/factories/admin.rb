FactoryBot.define do
  factory :admin do
    email {Faker::Lorem.characters(number: 15)}
    password { password }
    password_confirmation { password }
  end
end