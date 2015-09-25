FactoryGirl.define do
  factory :peep do
    content "Hello everyone"
    created_at Time.now
    user_id 1
  end
end