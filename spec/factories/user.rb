FactoryGirl.define do

  factory :user do
    email 'chris@example.com'
    handle 'chweeks'
    password 'secret'
    password_confirmation 'secret'
  end

end
