require 'faker'
FactoryGirl.define do
  factory :user do
    name {Faker::Name.first_name}
    email {Faker::Internet.email}
    password {Faker::Number.number(8)}

  end
end
