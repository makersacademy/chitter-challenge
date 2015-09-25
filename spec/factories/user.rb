FactoryGirl.define do
  factory :user do
    email 'foo@bar.com'
    name 'foo'
    nickname 'bar'
    password 'password1234'
    password_confirmation 'password1234'
  end
end
