require 'sign_up'
describe SignUp do
  describe '.create' do
    it 'adds a user to the sign_up database' do
      example_user = SignUp.create(email: 'example1@fake_email.com', password: 'Password123', user_name: 'Joe Biden', handle: 'sleepy_joe')
      expect(example_user.email).to eq 'example1@fake_email.com'
      expect(example_user.user_name).to eq 'Joe Biden'
      expect(example_user.handle).to eq 'sleepy_joe'
    end
  end

  describe '.log_in_verified?' do
    context 'log in information is correct' do 
      it 'checks log in information against database and returns true' do
        example_user = SignUp.create(email: 'example1@fake_email.com', password: 'Password123', user_name: 'Joe Biden', handle: 'sleepy_joe')
        expect(SignUp.log_in_verified?(email: 'example1@fake_email.com', password: 'Password123')).to eq true
      end
    end
    context 'log in information is incorrect' do 
      it 'checks log in information against database and returns false' do
        example_user = SignUp.create(email: 'example1@fake_email.com', password: 'Password123', user_name: 'Joe Biden', handle: 'sleepy_joe')
        expect(SignUp.log_in_verified?(email: 'example1@fake_email.com', password: 'WrongPassword123')).to eq false
      end
    end
  end

  describe '.find_user_name' do
    it 'returns a given bit of information about a user given a criteria' do 
      SignUp.create(email: 'example1@fake_email.com', password: 'Password123', user_name: 'Joe Biden', handle: 'sleepy_joe')
      expect(SignUp.find_user_name(email: 'example1@fake_email.com')).to eq 'Joe Biden'
    end
  end
end
