FactoryBot.define do
  factory :comment do
    comment { "example" }
    rating { 4 }
    association :user
    association :restaurant
  end
end
