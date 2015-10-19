FactoryGirl.define do
  factory :user do
    name 'anon'
    username 'anon1'
    email 'email@email.com'
    password 'password'
    password_confirmation 'password'
    id 11
  end
end
