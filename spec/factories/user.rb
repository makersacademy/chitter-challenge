FactoryGirl.define do

  factory :user do
    email 'foo@bar.com'
    username 'foooo'
    password 'secret1234'
    password_confirmation 'secret1234'
  end

  factory :baduser, class: User do
    email 'foo@bar.com'
    username 'fooouu'
    password 'secret1234'
    password_confirmation 'secret'
  end

  factory :noemailuser, class: User do
    email ""
    username 'foo'
    password 'secret1234'
    password_confirmation 'secret1234'
  end

  factory :username, class: User do
    email 'foo@test.com'
    username 'foooo'
    password 'secret1234'
    password_confirmation 'secret1234'
  end
end
