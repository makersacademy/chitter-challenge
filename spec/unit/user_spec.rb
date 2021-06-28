require 'user'
require 'database_helpers'

describe User do
  
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123')

      persisted_data = persisted_data(username: user.username, table: 'users')

      expect(user).to be_a User
      expect(user.username).to eq persisted_data.first['username']
      expect(user.email).to eq 'test@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'returns the user' do
      user = User.create(email: 'test@example.com', password: 'password123')

      result = User.find(username: user.username)

      expect(result.username).to eq user.username
      expect(result.email).to eq user.email
    end
    it 'returns nil if there is no ID(username) given' do
      expect(User.find(username: nil)).to eq nil
    end
  end
end
