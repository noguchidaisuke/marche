FactoryBot.define do
  factory :comment do
    comment {'test'}
    association :restaurant
  end
end
