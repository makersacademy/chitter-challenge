FactoryGirl.define do

  factory :user do
    email 'test@test.com'
    name 'first last'
    username 'firstlast'
    password 'test'
    password_confirmation 'test'
  end

end
