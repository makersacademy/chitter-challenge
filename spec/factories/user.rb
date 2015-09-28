FactoryGirl.define do

  factory :user do
    username 'testbot'
    email 'test@example.com'
    password '123'
    password_confirmation '123'
  end

end
