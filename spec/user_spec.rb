require 'database_helpers'
require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'example@example.com', user_name: 'Jimmy', name: 'James', password: 'password123')

      persisted_data = persisted_data(id: user.id, table: 'users')

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'example@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@example.com', user_name: 'JD', name: 'Josh', password: 'password123')
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', user_name: 'JD', name: 'Josh', password: 'password123')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
      expect(result.user_name).to eq user.user_name
      expect(result.name).to eq user.name
    end
    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.all' do
    it 'returns all users' do
      # test data
      a_user = User.create(email: 'test1@example.com', user_name: 'JD', name: 'Josh', password: 'password123')
      User.create(email: 'test2@example.com', user_name: 'Jim', name: 'James', password: 'password123')
      User.create(email: 'test3@example.com', user_name: 'Bob', name: 'Rob', password: 'password123')

      users = User.all

      expect(users.length).to eq 3
      expect(users.first).to be_a User
      expect(users.first.id).to eq a_user.id
      expect(users.first.email).to eq 'test1@example.com'
      expect(users.first.user_name).to eq 'JD'
      expect(users.first.name).to eq 'Josh'
    end
  end
end
