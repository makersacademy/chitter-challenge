FactoryGirl.define do
  factory :user do
    username "Johndoe79"
    email "jdoe79@gmail.com"
    password  "password"
    password_confirmation  "password"
  end
end