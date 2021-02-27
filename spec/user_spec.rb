require 'user'
require 'database_helpers'

describe User do
  it 'creates an user with details provided' do
    user = User.create(email: 'test@example.com', password: 'password123', name: 'Chrissy', username: 'chrisc')

    persisted_data = persisted_data(table: 'users', id: user.id)

    expect(user).to be_a User
    expect(user.name).to eq 'Chrissy'
    expect(user.username).to eq 'chrisc'
    expect(user.id).to eq persisted_data.first['id']
  end

  describe '.create' do
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@example.com', password: 'password123', name: 'Chrissy', username: 'chrisc')
    end
  end

  describe '.find' do
    it 'returns an User object using the result from the database by looking up the user id' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Chrissy', username: 'chrisc')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.name).to eq user.name
      expect(result.username).to eq user.username
    end
  end

  describe '.authenticate' do
    
  end
end
