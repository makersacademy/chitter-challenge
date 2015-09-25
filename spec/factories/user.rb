FactoryGirl.define do
# FactoryGirl will assume the present model 'user' to be 'User'
  factory :user do
    email                 'james.bond@mi6.com'
    password              'agent007'
    password_confirmation 'agent007'
    name                  'James Bond'
    username              'james_bond'
  end
end
