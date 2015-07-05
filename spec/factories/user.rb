FactoryGirl.define do
  
  factory :user do
    email 'foo@bar.com'
    username 'Foo'
    password 'biscotti'
    password_confirmation 'biscotti'
  end
end