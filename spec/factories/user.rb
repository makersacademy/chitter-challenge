FactoryGirl.define do

  factory :user do
    username              'joema'
    email                 'joe@ma.com'
    password              'beer!'
    password_confirmation 'beer!'
  end

end
