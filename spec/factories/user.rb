FactoryGirl.define do

  factory :user do # FactoryGirl will assume that the parent model of a factory named ":user" is "User".
    email 'foo@bar.com'
    username 'foobar_user'
    password 'secret1234'
    password_confirmation 'secret1234'
  end

end