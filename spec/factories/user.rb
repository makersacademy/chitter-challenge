FactoryGirl.define do

  factory :user do
    name 'Foo Bar'
    username 'foobar'
    email 'foo@bar.com'
    password 'secret1234'
    password_confirmation 'secret1234'
  end

end
