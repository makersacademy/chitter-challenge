require 'database_helpers'
require 'user'

describe User do
  describe '.create' do
    it 'hashes the password using bcrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@example.com', password: 'password123', name: 'Test', username: 'Tester')
    end

    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test', username: 'Tester')

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
      expect(user.name).to eq 'Test'
      expect(user.username).to eq 'Tester'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test', username: 'Tester')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
      expect(result.name).to eq user.name
      expect(result.username).to eq user.username
    end

    it 'returns nil if no ID is given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test', username: 'Tester')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      User.create(email: 'test@example.com', password: 'password123', name: 'Test', username: 'Tester')

      expect(User.authenticate(email: 'wrongemail@example.com', password: 'password123')).to be nil
    end

    it 'returns nil given an incorrect password' do
      User.create(email: 'test@example.com', password: 'password123', name: 'Test', username: 'Tester')

      expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be nil
    end
  end
end
