require 'user'
require 'database_helpers'

describe User do
  describe '#initialize' do
    it 'creates a new user and returns their name' do
      user = User.register(username: 'Aimee', password: 'password')
      expect(user.username).to eq find_by_id(id: user.id)['username']
    end
  end

  describe '#self.register' do
    it 'adds a user to the database' do
      user = User.register(username: 'Aimee', password: 'password')
      result = find_by_id(id: user.id)
      expect(user.username).to eq result['username']
    end
  end

  describe '#self.find' do
    it 'finds a user from the database' do
      User.register(username: 'Aimee', password: 'password')
      found_user = User.find(username: 'Aimee', password: 'password')
      expect(found_user.username).to eq 'Aimee'
      expect(found_user.password).to eq 'password'
    end
  end
end
