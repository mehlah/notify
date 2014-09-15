FactoryGirl.define do
  factory :user do
    name 'Mr. John Doe'
    sequence(:email) { |n| "user-#{n}@example.com" }
    password 'password'
  end
end
