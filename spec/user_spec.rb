require './lib/user'

describe User do
  
  describe '.create' do
    it 'creates a new user' do
      user = User.create(username: 'Xavier', password: 'chewba', email: 'test@test.com')
      expect(user).to be_a User
      expect(user.username).to eq 'Xavier'
      expect(user.email).to eq 'test@test.com'
    end
  end
end