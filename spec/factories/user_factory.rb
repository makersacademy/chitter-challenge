FactoryGirl.define do

  factory :user do
    name                  'Person'
    username              'pers0n'
    email                 'person@mail.com'
    password              'bananas!'
    password_confirmation 'bananas!'
  end

  factory :confirmed_user, :parent => :user do
    after(:create) { |user| user.confirm! }
  end

end
