FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "Class #{n}" }
    user
  end
end
