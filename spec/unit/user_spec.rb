require 'user'
require_relative '../database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Gaya Skinner', username: 'gskinner')

      persisted_user = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.name).to eq 'Gaya Skinner'
      expect(user.email).to eq 'test@example.com'
      expect(user.username).to eq 'gskinner'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@example.com', password: 'password123', name: 'Gaya Skinner', username: 'gskinner')
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Gaya Skinner', username: 'gskinner')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
      expect(result.name).to eq user.name
      expect(result.username).to eq user.username
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Gaya Skinner', username: 'gskinner')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')
  
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Gaya Skinner', username: 'gskinner')
  
      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Gaya Skinner', username: 'gskinner')
  
      expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
    end
  end
end
