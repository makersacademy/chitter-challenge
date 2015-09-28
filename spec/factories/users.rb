FactoryGirl.define do

  factory :user do
    email     'mick@makers.co.uk'
    name      'Mick Maker'
    username  'MickTheMiller'
    password  'Make1234'
    password_confirmation 'Make1234'
  end

end