FactoryGirl.define do
  factory :user do
    username 'abc'
    email 'abc@test.com'
    password '123'
    password_confirmation '123'
  end
end