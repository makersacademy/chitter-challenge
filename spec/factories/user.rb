FactoryGirl.define do

  factory :user do
    full_name 'Alice Foo'
    email 'afoo@fakemail.com'
    username 'alicefoo'
    password 'pazzword123'
    password_confirmation 'pazzword123'
  end
end
