require 'user'
require 'database_helpers.rb'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        name: 'Test User',
        email: 'test@email.com',
        username: 'test username',
        password: 'password123'
      )
      persisted_data = persisted_data(table: :users, id: user.id)
      p persisted_data
      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.username).to eq 'test username'
      expect(user.email).to eq 'test@email.com'
    end
  end

end
