require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(fullname: 'Riya Dattani', email: 'test@example.com', username: 'riya', password: 'password123')
      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.fullname).to eq 'Riya Dattani'
      expect(user.username).to eq 'riya'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(fullname: 'Riya Dattani', email: 'test@example.com', username: 'riya', password: 'password123')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.fullname).to eq user.fullname
      expect(result.username).to eq user.username
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end
end
