FactoryGirl.define do
  factory :user do
    name 'Mr. John Doe'
    sequence(:email) { |n| "user-#{n}@example.com" }
    password 'password'

    trait :with_groups do
      ignore do
        groups_count 1
      end

      after(:create) do |user, evaluator|
        create_list(:group, evaluator.groups_count, user: user)
      end
    end
  end
end
