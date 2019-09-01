require 'user'
require_relative 'database_helper'
require 'bcrypt'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'John', email: 'test@example.com', password: 'password123')
      data = data(table: 'users', id: user.id[0])
      expect(user).to be_a User
      expect(user.id[0]).to eq data['id']
      expect(user.name).to eq 'John'
      expect(user.email).to eq 'test@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(name: 'John', email: 'test@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(name: 'John', email: 'test@example.com', password: 'password123')
      result = User.find(user.id[0])
      expect(result.id[0]).to eq user.id[0]
      expect(result.name).to eq user.name
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(name: 'John', email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user = User.create(name: 'John', email: 'test@example.com', password: 'password123')
      auth = User.authenticate(email: 'wrongemail@example.com', password: 'password123')
      expect(auth).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(name: 'John', email: 'test@example.com', password: 'password123')
      auth = User.authenticate(email: 'test@example.com', password: 'wrongpassword')
      expect(auth).to be_nil
    end
  end
end
