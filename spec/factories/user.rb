FactoryGirl.define do

  factory :user do # assume parent model of a factory named ":user" is "User"
    email    'alice@example.com'
    name     'Alice Wonderland'
    username 'alice123'
    password 'tarts'
    password_confirmation 'tarts'
  end

end
