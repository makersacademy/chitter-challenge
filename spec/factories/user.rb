FactoryGirl.define do
  factory :user do
    email 'rebecca@example.com'
    name 'Rebecca'
    password '12345678'
    password_confirmation '12345678'
    username 'katylouise'

    factory :user_two do
      email 'james@example.com'
      name 'James'
      password 'onion'
      password_confirmation 'onion'
      username 'jimmy'
    end

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