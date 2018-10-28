require 'user'
require 'database_helper'
describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Tester', username: 'ChitterTester', email: 'test@example.com', password: 'password123')
      persisted_data = persisted_data(id: user.id, table: 'users')
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.name).to eq 'Tester'
      expect(user.username).to eq 'ChitterTester'
      expect(user.email).to eq 'test@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(name: 'Tester', username: 'ChitterTester', email: 'test@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'returns the user' do
      user = User.create(name: 'Tester', username: 'ChitterTester', email: 'test@example.com', password: 'password123')
      result = User.find(id: user.id)
      expect(result.id).to eq user.id
      expect(result.name).to eq user.name
      expect(result.username).to eq user.username
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(name: 'Tester', username: 'ChitterTester', email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(username: 'ChitterTester', password: 'password123')
      expect(authenticated_user.id).to eq user.id
    end
  end
end
