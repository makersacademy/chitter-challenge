require 'factory_girl'

FactoryGirl.define do

  factory :user do
    email 'alice@example.com'
    name 'Alice Example'
    username 'alice'
    password '12345678'
    password_confirmation '12345678'
  end
end
