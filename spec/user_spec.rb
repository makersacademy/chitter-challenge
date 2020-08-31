describe 'User' do
  describe '#.create' do
    it 'creates a user' do
      user = User.create(email: 'peeping@peepers.com', password: 'SuperSecretPassword123')

      expect(user).to be_a User
      expect(user.email).to eq 'peeping@peepers.com'
    end

    it 'hashes the password using bcrypt' do
      expect(BCrypt::Password).to receive(:create).with('SuperSecretPassword123')

      User.create(email: 'peeping@peepers.com', password: 'SuperSecretPassword123')
    end
  end

  describe '#.find' do
    it 'finds a user by id' do
      user = User.create(email: 'peeping@peepers.com', password: 'SuperSecretPassword123')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end

  describe '#.authenticate' do
    it 'returns a user given a correct username and password' do
      user = User.create(
        email: 'peeping@peepers.com',
        password: 'SuperSecretPassword123'
      )
      authenticated_user = User.authenticate(
        email: 'peeping@peepers.com',
        password: 'SuperSecretPassword123'
      )

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email' do
      user = User.create(
        email: 'peeping@peepers.com',
        password: 'SuperSecretPassword123'
      )

      expect(User.authenticate(
        email: 'wrong@email.com',
        password: 'SuperSecretPassword123'
        )).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(
        email: 'peeping@peepers.com',
        password: 'SuperSecretPassword123'
      )

      expect(User.authenticate(
        email: 'peeping@peepers.com',
        password: 'SuperWrongPassword123'
        )).to be_nil
    end
  end
end