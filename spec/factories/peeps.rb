FactoryGirl.define do
  factory :peep do
    body 'a peep'
    time Time.now


    factory :peep_second do
      body 'another peep'
      time Time.now + 60
    end
  end
end