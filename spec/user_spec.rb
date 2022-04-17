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

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('test123')
      User.create(
        email: 'test@example.com',
        password: 'test123',
        name: 'Tester Test',
        username: 'TTest'
      )
    end

    it 'does not create a new user if email already in use' do
      user = User.create(
        email: 'test@example.com',
        password: 'test123',
        name: 'Tester Test',
        username: 'TTest'
      )
      user2 = User.create(
        email: 'test@example.com',
        password: '123test',
        name: 'Test Tester',
        username: 'TTester'
      )
      expect(user2).to eq(nil)
    end

    it 'does not create a new user if username already in use' do
      user = User.create(
        email: 'test@example.com',
        password: 'test123',
        name: 'Tester Test',
        username: 'TTest'
      )
      user2 = User.create(
        email: 'tester@example.com',
        password: '123test',
        name: 'Test Tester',
        username: 'TTest'
      )
      expect(user2).to eq(nil)
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

  describe '.authenticate' do
    it 'allows a user to login given a correct email and password, if one exists' do
      user = User.create(
        email: 'test@example.com',
        password: 'test123',
        name: 'Tester Test',
        username: 'TTest'
      )
      authenticated_user = User.authenticate('test@example.com', 'test123')
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      expect(User.authenticate('failtest@example.com', 'test123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      expect(User.authenticate('test@example.com', 'failtest123')).to be_nil
    end
  end

end
