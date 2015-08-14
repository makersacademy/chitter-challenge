FactoryGirl.define do

  factory :user do
    email 'example@example.com'
    username 'example_user'
    password '1234'
    password_confirmation '1234'
  end
end