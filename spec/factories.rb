FactoryGirl.define do
  factory :user do
  name                  'Humpty Dumpty'
  username              'humptydumpty'
  email                 'humptydumpty@wall.com'
  password              'abc123'
  password_confirmation 'abc123'
  end
end
