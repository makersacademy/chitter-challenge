require 'user'
require 'pry'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(username: 'user1', name: 'name1', email: 'email@gmail.com', password: 'password123')

      expect(user.id).not_to be_nil
    end
  end

  describe '.all' do
    it 'returns all users, wrapped in a User instance' do
      user = User.create(username: 'user1', name: 'name1', email: 'email@gmail.com', password: 'password123')

      expect(User.all.map(&:id)).to include user.id
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(username: 'user1', name: 'name1', email: 'email@gmail.com', password: 'password123')
      
      expect(User.find(user.id).username).to eq user.username
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      expect(User.find(nil)). to eq nil
    end
  end
end
