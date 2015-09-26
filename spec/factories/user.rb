FactoryGirl.define do

  factory :user do # FactoryGirl will assume that the parent model of a factory named ":user" is "User".
    email    'alice@example.com'
    password 'tarts'
    password_confirmation 'tarts'
    name     'Alice Wonderland'
    username 'alice123'
  end

end
