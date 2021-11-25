FactoryBot.define do
  factory :tag do
    tag_name { Faker::Lorem.chracters(number: 5)}
  end
end