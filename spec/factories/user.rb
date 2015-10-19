FactoryGirl.define do

  factory :user do
    username              'joema'
    email                 'joe@ma.com'
    name                  'Joe Zhou'
    password              'beer!'
    password_confirmation 'beer!'
  end

end
