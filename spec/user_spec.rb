require 'user'
require_relative './database_helper'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        email: 'test@example.com',
        password: 'test123',
        name: 'Tester Test',
        username: 'TTest'
      )
      persisted_data = persisted_data(table: :users, id: user.id)
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
      expect(user.username).to eq 'TTest'
    end
  end

end
