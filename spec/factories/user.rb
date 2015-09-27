FactoryGirl.define do
  factory :user do
    email 'foo@bar.com'
    name 'foo'
    nickname 'bar'
    password 'password1234'
    password_confirmation 'password1234'
  end

  factory :another_user, class: User do
    email 'another@user.com'
    name 'another'
    nickname 'user'
    password 'secret'
    password_confirmation 'secret'
  end
end
