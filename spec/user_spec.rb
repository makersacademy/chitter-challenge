require 'database_helpers'
require 'user'

describe User do
  describe '.create' do
    it 'Creates a new user' do
      user = User.create(email: 'test@example.com',
        password: 'password', name: 'test', username: 'test123')
      persisted_data = persisted_data(table: :users, id: user.id)
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
      expect(user.name).to eq 'test'
    end
  end
end
