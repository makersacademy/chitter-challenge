FactoryGirl.define do

  factory :user do
    email 'foo@bar.com'
    password 'secret1234'
    password_confirmation 'secret1234'
  end

  factory :baduser, class: User do
    email 'foo@bar.com'
    password 'secret1234'
    password_confirmation 'secret'
  end

  factory :noemailuser, class: User do
    email ""
    password 'secret1234'
    password_confirmation 'secret1234'
  end
end
