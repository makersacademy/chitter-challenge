FactoryGirl.define do

  factory :peep do
    content               'Hello world!'
    creation_time         Time.local(2015, 9, 27, 12, 0, 0)
  end

end
