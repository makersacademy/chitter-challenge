FactoryGirl.define do  

  factory :user do
    name 'foo'
    username 'fooman'
    email 'foo@test.com'
    password '12345'
    password_confirmation '12345'
  end

end