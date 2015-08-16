require 'factory_girl'

FactoryGirl.define do

  factory :peep do 
    message 'The first peep'
    time Time.now
  end

end