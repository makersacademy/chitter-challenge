require 'database_helper'
require 'user'
require 'setup_test_database'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Mabon', username: 'Maby0', email: 'mabon11@makers.org', password: 'password123')

      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.name).to eq 'Mabon'
      expect(user.username).to eq 'Maby0'
      expect(user.email).to eq 'mabon11@makers.org'
    end
  end

  describe '.find' do
    it 'finds user by ID' do
      user = User.create(name: 'Mabon', username: 'Maby0', email: 'mabon11@makers.org', password: 'password123')
      result = User.find(user.id)

      expect(result.id).to eq user.id
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
end