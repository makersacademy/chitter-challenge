require './lib/user'
require './spec/database_helpers'

describe User do
  describe '.all' do
    it 'returns all users' do
      User.create(email: 'john@smith.com', password: 'password', username: 'jsmith91', name: 'John Smith')
      all_users = User.all
      expect(all_users.length).to eq(1)
      expect(all_users.first.email).to eq('john@smith.com')
      expect(all_users.first.password).to eq('password')
      expect(all_users.first.username).to eq('jsmith91')
      expect(all_users.first.name).to eq('John Smith')
    end
  end

  describe '.create' do
    it 'can create a new user' do
      User.create(email: 'john@smith.com', password: 'password', username: 'jsmith91', name: 'John Smith')
      expect(user.password).to eq('password')      
    end

    it 'creates a new user and stores the data in a users table' do
      user = User.create(email: 'john@smith.com', password: 'password', username: 'jsmith91', name: 'John Smith')
      persisted_data = persisted_data(id: user.id, table: 'users')    
      expect(user).to be_a(User)
      expect(user.id).to eq(database_data.first['id'])
      expect(user.email).to eq('john@smith.com')

    end
  end

  describe '.find' do
    it 'can find a user by id' do
      user = User.create(email: 'john@smith.com', password: 'password', username: 'jsmith91', name: 'John Smith')
      found_user = User.find(id: user.id)
      expect(found_user).to be_a(User)
      expect(found_user.email).to eq('john@smith.com')
    end
  end
end