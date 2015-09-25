FactoryGirl.define do
  factory :user do
    email 'bob@example.com'
    password_digest 'bobspassword'
  end
end