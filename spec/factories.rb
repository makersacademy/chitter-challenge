FactoryGirl.define do

  factory :user do
    name                  'Catherine Stevenson'
    email                 'catherine@example.com'
    username              'cat'
    password              'secret1234'
    password_confirmation 'secret1234'
  end
end
