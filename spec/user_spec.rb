require 'user'
require 'database_helpers'

RSpec.describe User do
  describe '.create method' do
    it 'creates a new user' do
      user = User.create(
        name: 'Dack Jorsey', username: 'dack',
        email: 'example@example.com', password: 'password123'
      )
      persisted_data = persisted_data(id: user.id, table: 'users')

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.name).to eq 'Dack Jorsey'
      expect(user.username).to eq 'dack'
      expect(user.email).to eq 'example@example.com'
    end
  end
end