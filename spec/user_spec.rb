require './app/lib/user'
require './spec/database_helpers'
require 'bcrypt'

describe User do
  describe '.all' do
    it 'returns all users' do
      User.create(email: 'hi@hello.com', password: 'password')
      all_users = User.all
      expect(all_users.length).to eq(1)
      expect(all_users.first.email).to eq('hi@hello.com')
    end
  end
  
  describe '.create' do
    it 'can create a new user' do
      user = User.create(email: 'hi@hello.com', password: 'password')
      expect(user.email).to eq('hi@hello.com')
    end
    
    it 'creates a new user test 2' do
      user = User.create(email: 'hi@hello.com', password: 'password')
      database_data = database_data(table: 'users', id: user.id)
      p "DATABASE DATA..."
      p database_data      
      expect(user).to be_a(User)
      expect(user.id).to eq(database_data.first['id'])
      expect(user.email).to eq('hi@hello.com')
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(email: 'test@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'can find a user by id' do
      user = User.create(email: 'hi@hello.com', password: 'password')
      found_user = User.find(id: user.id)
      expect(found_user).to be_a(User)
      expect(found_user.email).to eq('hi@hello.com')
    end
  end
end
