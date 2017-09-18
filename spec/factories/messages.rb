require 'faker'
FactoryGirl.define do
  factory :message do
    id         {Faker::Number.between(1,10)}
    body       {Faker::Lorem.sentence}
    image      Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image/hotcoffee.jpeg'))
    created_at {Faker::Time.between(2.days.ago, Time.now, :all)}
    group
    user
  end
end
