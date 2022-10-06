require 'user'
require 'database_helpers'

describe '.create' do
  it 'creates a new user' do
    user = User.create(name: 'Administrator', username: 'admin', email: 'test@example.com', password: 'password123')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    #expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@example.com'
  end
  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(name: 'Administrator', username: 'admin', email: 'test@example.com', password: 'password123')
      result = User.find(id: user.id)
  
      expect(result.id).to eq user.id
      expect(result.name).to eq user.name
      expect(result.username).to eq user.username
      expect(result.email).to eq user.email
    end
  end
  describe '.create' do
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
  
      User.create(name: 'Administrator', username: 'admin', email: 'test@example.com', password: 'password123')
    end
  end
end