require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email "simon@example.com"
    name  "Simon"
    username "simon"
    password "12345"
    password_confirmation "12345"
  end
end