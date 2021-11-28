FactoryBot.define do
  factory :relationship do
    association :following
    association :followed
  end
end