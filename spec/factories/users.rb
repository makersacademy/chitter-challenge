FactoryGirl.define do
  factory :user do
    name     'Sarah'
    handle   'sarah'
    email    'mail@example.com'
    password '123456789!'
    password_confirmation '123456789!'
  end
end