require 'faker'
FactoryGirl.define do
  pass = Faker::Internet.password(8)
  factory :user do
    name                  {Faker::Name.first_name}
    email                 {Faker::Internet.email}
    password              pass
    password_confirmation pass

  end
end
