require 'factory_girl'

FactoryGirl.define do

  factory :user do 
    email 'katya@example.com'
    password '1234567'
    password_confirmation '1234567'
    name 'Katya'
    username 'kvyas'
  end

end