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

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(
        name: 'Dack Jorsey', username: 'dack',
        email: 'example@example.com', password: 'password123'
      )
    end
  end

  describe '.authenticate method' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(
        name: 'Dack Jorsey', username: 'dack',
        email: 'example@example.com', password: 'password123'
      )
      authenticated_user = User.authenticate(username: 'dack', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect username' do
      user = User.create(
        name: 'Dack Jorsey', username: 'dack',
        email: 'example@example.com', password: 'password123'
      )

      expect(User.authenticate(username: 'jack', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(
        name: 'Dack Jorsey', username: 'dack',
        email: 'example@example.com', password: 'password123'
      )

      expect(User.authenticate(username: 'dack', password: 'password456')).to be_nil
    end
  end

  describe '.find method' do
    it 'returns a user when passed a user id' do
      user = User.create(
        name: 'Dack Jorsey', username: 'dack',
        email: 'example@example.com', password: 'password123'
      )

      found_user = User.find(user.id)

      expect(found_user).to be_a User
      expect(found_user.id).to eq user.id
      expect(found_user.username).to eq user.username
    end

    it 'returns nil if not ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
end