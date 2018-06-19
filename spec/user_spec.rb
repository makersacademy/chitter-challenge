require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')

      expect(user.id).not_to be_nil
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')
    end
  end

  describe '.all' do
    it 'returns all users, wrapped in a User instance' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')

      expect(User.all.map(&:id)).to include user.id
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')

      expect(User.find(user.id).email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end
  end
end
