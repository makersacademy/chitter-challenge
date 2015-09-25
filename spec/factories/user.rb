FactoryGirl.define do
  factory(:user) do
    email('test@test.com')
    password('12345')
    password_confirmation('12345')
    name('Test')
    username('testing_123')
  end
end