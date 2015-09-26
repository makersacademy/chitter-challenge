FactoryGirl.define do
  factory :user do
    username "Johndoe79"
    email "jdoe79@gmail.com"
    password  "Atlanta2010"
    password_confirmation  "Atlanta2010"
  end

  factory :no_email do
    username "Johndoe79"
    email nil
    password  "Atlanta2010"
    password_confirmation  "Atlanta2010"    
  end
end