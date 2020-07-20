require 'user'

describe User do
  require 'database_helpers'

  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'cat@email.com', password: 'password123', name: 'Cat', username: 'catty')
      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'cat@email.com'
      expect(user.name).to eq 'Cat'
      expect(user.username).to eq 'catty'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'cat@email.com', password: 'password123', name: 'Cat', username: 'catty')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
      expect(result.name).to eq user.name
      expect(result.username).to eq user.username
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end
end
