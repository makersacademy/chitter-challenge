FactoryGirl.define do
  factory :user do
    name 'Alice Smith'
    username 'alicesmith'
    email 'alice@example.com'
    password 'oranges!'
    password_confirmation 'oranges!'
  end
end
