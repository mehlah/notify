FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "Class #{n}" }
    user

    trait :with_subscriptions do
      ignore do
        subscriptions_count 1
      end

      after(:create) do |group, evaluator|
        create_list(:subscription, evaluator.subscriptions_count, group: group)
      end
    end
  end
end
