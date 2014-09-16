FactoryGirl.define do
  factory :subscriber do
    sequence(:name) { |n| "Subscriber #{n}" }
    phone '0642755592'
  end
end
