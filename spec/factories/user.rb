FactoryGirl.define do
  factory :user do
    email 'foo@bar.com'
    password 'secret1234'
    username 'foobar'
    name 'Foo Bar'
  end
end
