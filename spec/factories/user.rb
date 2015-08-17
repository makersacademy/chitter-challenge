FactoryGirl.define do
  factory :user do
    email 'john@doe.com'
    name 'John Doe'
    username 'JD03'
    password 'secret1234'
    password_confirmation 'secret1234'
  end
end
