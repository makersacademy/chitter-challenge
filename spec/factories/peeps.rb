FactoryGirl.define do
  factory :peeps do
    message 'First'
    username 'anon1'
    time DateTime.parse '2015-09-27T13:15:38+01:00'
    user_id 11
  end
end
