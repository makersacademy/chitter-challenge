FactoryGirl.define do

    factory :user do
      email    'alice@example.com'
      # username 'Alicem'
      password '12345678'
      password_confirmation '12345678'

      factory :failed_user do
      password_confirmation '1234556789'
    end
  end
end
