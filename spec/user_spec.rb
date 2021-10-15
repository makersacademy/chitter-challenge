require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(username: 'test_user', email: 'test@example.com', password: 'password123')

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.username).to eq 'test_user'
      expect(user.email).to eq 'test@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(username: 'test_user', email: 'test@example.com', password: 'password123')
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(username: 'test_user', email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(username: 'test_user', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end
  end
end