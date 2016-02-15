FactoryGirl.define do
  factory :user do
    username 'amanzano'
    password 'pass'
    password_confirmation 'pass'
    email 'arnold@myemail.com'
    name 'Arnold Manzano'
  end

  factory :peep do
    message 'This is my peep'
    datetime { Time.now }
    user { user }
  end
end
