FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 5) }
    introduction { Faker::Lorem.characters(number: 20) }
    address { "東京都渋谷区富ヶ谷1-49-3" }
    association :user
  end
  
  factory :new_post_1, class: "Post" do
    title { "面白いビル" }
    introduction { "kokoko" }
    address { "千葉県浦安市当代島2-10-17"}
    tag_name { "マンション" }
  end
end