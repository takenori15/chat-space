require 'faker'
FactoryGirl.define do
  factory :group do
    group_name {Faker::Name.first_name}
    created_at {Faker::Time.between(2.days.ago, Time.now, :all)}
  end
end
