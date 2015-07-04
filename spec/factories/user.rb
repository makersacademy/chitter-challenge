FactoryGirl.define do

  factory :user do # FactoryGirl will assume that the parent model of a factory named ":user" is "User".
    email 'loliphant@test.com'
    name 'Lucy Oliphant'
    username 'loli'
    password '12345678'
    password_confirmation '12345678'
  end

end
