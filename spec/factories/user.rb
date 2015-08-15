FactoryGirl.define do
  factory :user do
    email 'foo@bar.com'
    password 'secret1234'
    password_confirmation 'secret1234'
    name 'Foo Bar'
    user_name 'foobar'
  end
end
