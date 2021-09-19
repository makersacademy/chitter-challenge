require 'database_helper'
require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123')

      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a(User)
      expect(user.id).to eq(persisted_data['id'])
      expect(user.email).to eq('test@example.com')
    end
  end
end