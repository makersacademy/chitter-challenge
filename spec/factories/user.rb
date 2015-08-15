FactoryGirl.define do
  factory :user do
    email 'john@doe.com'
    name 'John Doe'
    username 'JD03'
    password 'secret'
    #password_confirmation 'secret'
  end
end
