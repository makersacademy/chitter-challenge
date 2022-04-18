require_relative '../lib/user'
require_relative './choose_database_table'


describe User do
  context '#create' do
    it 'creates a user' do
      user = User.create(
        email: 'test@example.com',
        password: 'password123',
        name: 'Conor',
        username: 'Thor'
      )
      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.email).to eq persisted_data.first['email']
      expect(user.name).to eq persisted_data.first['name']
      expect(user.username).to eq persisted_data.first['username']
    end
  end
end