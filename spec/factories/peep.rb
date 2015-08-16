FactoryGirl.define do
  factory :peep do
    content "Hello everyone"
    created_at Time.now
  end
end