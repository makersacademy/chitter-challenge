FactoryGirl.define do

  factory :user do
    email 'pip@example.com'
    username 'pip'
    password '123'
    password_confirmation '123'
  end

end
