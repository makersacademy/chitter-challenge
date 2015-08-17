FactoryGirl.define do

  factory :user, class: User do
    email 'sam@makersacademy.com'
    password 's3cr3t'
    first_name 'Samuel'
    last_name 'Joseph'
    username 'tansaku'
  end
end
