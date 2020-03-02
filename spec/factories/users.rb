FactoryBot.define do
  factory :user do
    name {"testuser"}
    sequence(:email) { |n| "test#{n}@ex.com"}
    password {"test"}
    
    trait :testuser do
      name {"testuser"}
      email {"test@test.test"}
      password {"test"}
    end
  end
end
