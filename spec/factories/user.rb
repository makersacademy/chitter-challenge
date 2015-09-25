FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'secret1234'
    password_confirmation 'secret1234'
    name 'test'
    user_name 'test'
  end
end