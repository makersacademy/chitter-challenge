require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'Creates a new user' do
      user = User.create(email: "test@example.com", password: "1234", username: "test_user")

      persisted_data = persisted_data(id: user.id, table: :users)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(email: 'test@example.com', password: 'password123', username: 'test_user')
    end
  end

  describe '.find' do
    it 'find the user by id' do
      user = User.create(email: "test@example.com", password: "1234", username: "test_user")
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if no session is found' do
      expect(User.find(id: nil)).to eq nil
    end
  end
end
