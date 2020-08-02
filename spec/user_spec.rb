require 'database_helpers'
require 'user'

describe User do
  describe '.create' do
    it 'Creates a new user' do
      user = User.create(email: 'test@example.com',
        password: 'password', name: 'test', username: 'test123')
      persisted_data = persisted_data(id: user.id)
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
      expect(user.name).to eq 'test'
      expect(user.username).to eq 'test123'
    end
  end

  describe '.find' do
    it 'Finds a user by its ID' do
      user = User.create(email: 'test@example.com',
        password: 'password', name: 'test', username: 'test123')
      result = User.find(id: user)
      expect(result.id).to eq user.id
      expect(result.email).to eq 'text@example.com'
    end
  end
end
