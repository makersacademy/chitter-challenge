require 'user'
require_relative '../spec/database_helper'

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

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(
        email: 'test@example.com',
        password: 'test123',
        name: 'Tester Test',
        username: 'TTest'
      )
      result = User.find(user.id)
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end

  end

end
