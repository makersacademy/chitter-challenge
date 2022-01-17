require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Bob', username: 'BobBamBoom', email: 'Bob@example.com', password: 'Banana123')

      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.username).to eq 'BobBamBoom'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(name: 'Bob', username: 'BobBamBoom', email: 'Bob@example.com', password: 'Banana123')
      result = User.find(user.id)
  
      expect(result.id).to eq user.id
      expect(result.username).to eq 'BobBamBoom'
    end
  end
end
