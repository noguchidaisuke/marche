FactoryBot.define do
    factory :user do
        name {'テストユーザー'}
        sequence(:email){ |n| "test#{n}@gmail.com" }
        password{'test'}
        
        trait :long do
            name{'testtesttesttestaaaaaaaaa'}
        end
    end
end