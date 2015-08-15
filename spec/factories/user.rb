FactoryGirl.define do
  factory :user do
    email 'rebecca@example.com'
    name 'Rebecca'
    password '12345678'
    password_confirmation '12345678'
    username 'katylouise'

    factory :wrong_password_user do
      password_confirmation 'sausage'
    end
  end
end