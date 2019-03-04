require './lib/user.rb'

describe 'user' do
  let(:user) { { username: 'simon', password: 'unbreakable' } }
  before(:each) { User.create(user) }

  describe 'when creating new user' do
    it 'should save the username' do
      expect(User.all[0].username).to eq(user[:username])
    end

    it 'should save the password as a hash' do
      expect(User.all[0].password.length).to be > user[:password].length
    end
  end

  describe 'when authenticating a user' do
    it 'should return true if username and password are valid' do
      expect(User.authenticated?(user)).to eq(true)
    end

    it 'should return false if username not found' do
      auth_result = User.authenticated?(username: 'stuff', password: user[:password])
      expect(auth_result).to eq(false)
    end

    it 'should return false if password is invalid' do
      auth_result = User.authenticated?(username: user[:username], password: 'stuff')
      expect(auth_result).to eq(false)
    end
  end
end
