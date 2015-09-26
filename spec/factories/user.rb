FactoryGirl.define do

  factory :user do
    email 'matt@matt.com'
    password 'popadum'
    password_confirmation 'popadum'

    factory :failed_user do
      password_confirmation '12345567'
    end
  end
end
