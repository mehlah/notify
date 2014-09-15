FactoryGirl.define do
  factory :group do
    sequence(:class_name) { |n| "Class #{n}" }
    user
  end
end
