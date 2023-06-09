require_relative '../lib/repositories/user_repository'
require_relative 'database_helper'

RSpec.describe UserRepository do
  before(:each) do 
    reset_chitter_table
  end

  context '.create' do
    it 'creates a new user in the database' do
      UserRepository.create('John Doe', 'johndoe', 'johndoe@example.com', 'password123')
      user = UserRepository.find_by_email('johndoe@example.com')

      expect(user.name).to eq('John Doe')
      expect(user.username).to eq('johndoe')
      expect(user.email).to eq('johndoe@example.com')
      expect(user.password).to eq('password123')
    end
  end

  context '.find_by_email' do
    it 'returns the user with the given email' do
      user = UserRepository.find_by_email('testuser1@example.com')

      expect(user).not_to be_nil
      expect(user.name).to eq('Test User 1')
      expect(user.username).to eq('testuser1')
      expect(user.email).to eq('testuser1@example.com')
      expect(user.password).to eq('password123')
    end

    it 'returns nil if no user found with the given email' do
      user = UserRepository.find_by_email('nonexistent@example.com')

      expect(user).to be_nil
    end
  end

  context '.authenticate' do
    it 'returns the user if the email and password match' do
      user = UserRepository.authenticate('testuser2@example.com', 'password456')

      expect(user).not_to be_nil
      expect(user.name).to eq('Test User 2')
      expect(user.username).to eq('testuser2')
      expect(user.email).to eq('testuser2@example.com')
      expect(user.password).to eq('password456')
    end

    it 'returns nil if the email and password do not match' do
      user = UserRepository.authenticate('testuser2@example.com', 'incorrect_password')

      expect(user).to be(nil)
    end
  end

  context '.all' do
    it 'returns all users from the database' do
      users = UserRepository.all

      expect(users.length).to eq(2)

      expect(users[0].name).to eq('Test User 1')
      expect(users[0].username).to eq('testuser1')
      expect(users[0].email).to eq('testuser1@example.com')
      expect(users[0].password).to eq('password123')

      expect(users[1].name).to eq('Test User 2')
      expect(users[1].username).to eq('testuser2')
      expect(users[1].email).to eq('testuser2@example.com')
      expect(users[1].password).to eq('password456')
    end
  end
end