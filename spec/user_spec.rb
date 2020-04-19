describe 'User' do
  let(:user) { 
    User.create(name: 'name', username: 'username', email: 'email', password: 'password') 
  }

  describe '.create' do
    it 'creates a user' do
      expect(user).to be_a User
      expect(user.username).to eq 'username'
    end
  end

  describe '.unique_email?' do
    it 'returns true if email does not exist' do
      expect(User.unique_email?('email2')).to eq true
    end

    it 'returns false if email already exists' do
      expect(User.unique_email?(user.email)).to eq false
    end
  end

  describe '.unique_username?' do
    it 'returns true if username does not exist' do
      expect(User.unique_username?('username2')).to eq true
    end

    it 'returns false if username already exists' do
      expect(User.unique_username?(user.username)).to eq false
    end
  end
end
