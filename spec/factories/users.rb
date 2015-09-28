FactoryGirl.define do
  factory :user do
    name 'Moe Sadoon'
    username 'moesadoon'
    email 'moe@example.com'
    password 'oranges!'
    password_confirmation 'oranges!'
  end
end
