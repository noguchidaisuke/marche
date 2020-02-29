FactoryBot.define do
  factory :comment do
    comment { "example" }
    rating { 5 }
    association :user
    association :restaurant
  end
end
