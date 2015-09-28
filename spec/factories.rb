FactoryGirl.define do

  factory :user do
    name 'Foogene Barrington'
    email 'foo@bar.com'
    password 'wibble'
    handle 'foobar'
  end

  factory :peep do
    message 'Little Bo Peep has lost her sheep'
    user
  end

end
