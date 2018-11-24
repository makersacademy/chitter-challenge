require 'user'
require 'database_helpers.rb'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        name: 'Test User',
        email: 'test@email.com',
        username: 'test username',
        password: 'password123'
      )
      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.username).to eq 'test username'
      expect(user.email).to eq 'test@email.com'
    end
  end

  describe '.find' do
    it 'returns a user from the db' do
      user = User.create(
        name: 'Test User',
        email: 'test@email.com',
        username: 'test username',
        password: 'password123'
      )
      persisted_data = persisted_data(table: :users, id: user.id)

      found_user = User.find(id: user.id)

      expect(found_user.id).to eq persisted_data['id']
      expect(found_user.username).to eq user.username
    end

  end

end
