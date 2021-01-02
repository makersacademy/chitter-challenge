describe 'User' do
  describe '.new' do
    it 'needs a name, username, email and password to register' do
      user = User.new(id: 1, name: 'Ara', username:'arabanana', email: 'ara@gmail.com', password:'random')
      expect(user.name).to eq 'Ara'
      expect(user.email).to eq 'ara@gmail.com'
      expect(user.username).to eq 'arabanana'
    end
  end

  describe '.create' do
    it 'hashes the password using bcrypt' do
      expect(BCrypt::Password).to receive(:create).with 'password123'
      User.create(username:'test', name:'test', email:'test@example.com', password:'password123')
    end

    it 'creates a new user' do
      user = User.create(username:'test', name:'test', email:'test@example.com', password:'password123')
      expect(user.id).not_to be_nil
    end

    it 'rejects if an email exists' do
      user = User.create(username:'test', name:'test', email:'test@example.com', password:'password123')
      expect(User.create(username:'test', name:'test', email:'test@example.com', password:'password123')).to be_nil
    end
  end

  describe '.find' do
    it 'finds the user with email' do
      user = User.create(username:'test', name:'test', email:'test@example.com', password:'password123')
      user = User.find('test@example.com')
      expect(user.name).to eq 'test'
    end

    it 'returns nil if no match is found' do
      user = User.find('random@example.com')
      expect(user).to be_nil
    end
  end

  describe '.authenticate' do
    it 'checks whether the password is correct' do
      User.create(username:'test', name:'test', email:'test@example.com', password:'password123')
      user = User.authenticate('test@example.com', 'password123')
      expect(user).not_to be_nil
    end
  end
end