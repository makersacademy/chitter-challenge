require 'factory_girl'

FactoryGirl.define do

  factory :peep do 
    message 'The first peep'
    time Timecop.freeze(Time.local(2015))
  end

end