#require 'faker'

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    name Faker::Name.name
    password '12345'
    password_confirmation '12345'
    username Faker::Internet.user_name
  end
end