FactoryGirl.define do
  factory :user do
    name "Monkey D. Luffy"
    email "captain@strawhats.com"
    username "Future Pirate King"
    password "AceSabo"
    password_confirmation "AceSabo"
  end
  factory :peep do
    content "I'm going to be King the Pirates!"
    user_id 1
  end
end