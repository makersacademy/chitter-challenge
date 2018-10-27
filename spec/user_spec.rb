require 'user'
require 'test_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')

      persisted_data = persisted_data(id: user.id, table: 'users')

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.name).to eq 'John'
      expect(user.username).to eq 'john'
      expect(user.email).to eq 'john@example.com'
    end
  end
end
