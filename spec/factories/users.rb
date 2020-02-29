FactoryBot.define do
  factory :user do
    name {"testuser"}
    sequence(:email) { |n| "test#{n}@ex.com"}
    password {"test"}
  end
end
