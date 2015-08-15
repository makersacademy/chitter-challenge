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

    factory :no_email_user do
      email ''
    end

    factory :no_username_user do
      username ''
    end
   end
end