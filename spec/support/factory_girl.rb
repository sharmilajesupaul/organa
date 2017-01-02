RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    first_name  Faker::Name.first_name
    last_name Faker::Name.last_name
    password Devise.friendly_token[0,20]   
  end
end