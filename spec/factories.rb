FactoryGirl.define do

  factory :peep do
    message 'Little Bo Peep has lost her sheep'
  end

  factory :user do
    name 'Foogene Barrington'
    email 'foo@bar.com'
    password 'wibble'
    handle 'foobar'
  end

end
