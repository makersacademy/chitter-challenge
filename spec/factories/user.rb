FactoryGirl.define do

  factory :user do # FactoryGirl will assume that the parent model of a factory named ":user" is "User".
    email 'sam@makersacademy.com'
    password 's3cr3t'
    #password_confirmation 'secret1234'
    first_name 'Samuel'
    last_name 'Joseph'
    username 'tansaku'

  end
end
