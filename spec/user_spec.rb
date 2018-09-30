describe User do
  describe '.create' do
    it 'creates a new user' do
      new_user = User.create(name: 'Test Name', username: 'Test', email: 'test@example.com', password: 'password123')

      expect(new_user).to be_a User
      expect(new_user).to respond_to :id
      expect(new_user.email).to eq 'test@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      
      User.create(name: 'Test Name', username: 'Test', email: 'test@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end

    it 'finds a user by ID' do
      user = User.create(name: 'Test Name', username: 'Test', email: 'test@example.com', password: 'password123')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end
end
