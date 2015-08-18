#require 'faker'

FactoryGirl.define do
  factory :user do
    password_faked = Faker::Internet.password
    email Faker::Internet.email
    name Faker::Name.name
    password password_faked
    password_confirmation password_faked
    username Faker::Internet.user_name
  end
end