FactoryBot.define do
  factory :post_image do
    image_id { Faker::Lorem.chracters(neumber: 15) }
    association :post
  end
end