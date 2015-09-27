FactoryGirl.define do
  factory :user do
    email 'jk@jk.com'
    username 'jk'
    password '12345'
    password_confirmation '12345'
    name 'John Kennedy'
  end
end
