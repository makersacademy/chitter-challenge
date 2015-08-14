FactoryGirl.define do
  factory :user do
    password              '123'
    email                 'user@example.com'
    password_confirmation '123'
    name                  'gerard'
    user_name             'grdm'
  end
end