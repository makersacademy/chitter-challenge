require 'sign_up.rb'
describe SignUp do
  describe '.create' do
    it 'adds a user to the sign_up database' do
      example_user = SignUp.create(email: 'example1@fake_email.com', password: 'Password123', user_name: 'Joe Biden', handle: 'sleepy_joe')
      expect(example_user.email).to eq 
      expect(example_user.user_name).to eq 
      expect(example_user.handle).to eq 
    end
  end
end