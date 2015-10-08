FactoryGirl.define do

  sequence :email do |n|
    "person#{n}@mail.com"
  end

  sequence :username do |n|
    "pers0n#{n}"
  end

  factory :user do
    name                  'Person'
    username              { generate(:username) }
    email                 { generate(:email) }
    password              'bananas!'
    password_confirmation 'bananas!'
  end

end
