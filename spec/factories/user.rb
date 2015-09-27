FactoryGirl.define do

  factory :user do
    email                 'catherine@example.com'
    name                  'Catherine Stevenson'
    username              'cat'
    password              'secret1234'
    password_confirmation 'secret1234'
  end

  factory :baduser, class: User do
    email                 'catherine@example.com'
    name                  'Catherine Stevenson'
    username              'cat'
    password              'secret1234'
    password_confirmation 'secret'
  end

  factory :nomailuser, class: User do
    email                 ''
    name                  'Catherine Stevenson'
    username              'cat'
    password              'secret1234'
    password_confirmation 'secret1234'
  end

  factory :username, class: User do
    email                 'catherine@example.com'
    name                  'Catherine Stevenson'
    username              'cat'
    password              'secret1234'
    password_confirmation 'secret1234'
  end
end 
