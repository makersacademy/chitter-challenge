FactoryGirl.define do
  factory :peep do
    message 'Hello, world'
    time Time.new
  end
end