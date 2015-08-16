FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password '12345678'
    password_confirmation '12345678'
    name 'test user'
    user_name 'test_user_name'

    factory :user_wrong_confirmation do
      password_confirmation 'wrong'
    end

    factory :user_no_email do
      email ''
    end

    factory :user_no_username do
      user_name ''
    end

    factory :user_wrong_password do
      password 'wrong'
    end

    factory :user_wrong_username do
      user_name 'wrong'
    end

  end
end
