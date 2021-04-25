require 'database_helpers'

describe User do
  context '.create' do
    it 'creates a new user' do
      user = User.create(username: 'johndoe', email: 'test@test.com', password: 'password123')

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.username).to eq 'johndoe'
      expect(user.email).to eq 'test@test.com'
    end
  end

  context '.find' do
    it 'finds a user by ID' do
      user = User.create(username: 'johndoe', email: 'test@test.com', password: 'password123')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
      expect(result.email).to eq user.email
    end
    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
end