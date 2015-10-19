FactoryGirl.define do 

  factory :user do 
    name 'dom'
    email 'dom@example.com'
    username 'dbatten'
    password '123'
    password_confirmation '123'
  end

end