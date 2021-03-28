require './lib/user.rb'
require 'setup_test_database.rb'
require 'spec_helper'

describe User do 

  describe '.add' do
    it 'adds a new user to the user database' do
      user = User.add(email: 'test@test.com', password: 'testpwd123', username: 'tester123', name: 'Test Tester')
      expect(user).to be_a User
      expect(user.id).to eq "1"
      expect(user.email).to eq 'test@test.com'
      expect(user.username).to eq 'tester123'
    end
    
    it 'encrypts the password with bcrypt' do 
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.add(email: 'test@example.com', password: 'password123', username: 'tester123', name: 'Test Tester')
    end 

  end

  describe '.find' do
    it 'finds a user by id and returns the user as User object' do
      user = User.add(email: 'test@test.com', password: 'testpwd123', username: 'tester123', name: 'Test Tester')
      test_id = user.id
      find_user = User.find(id: test_id)
      expect(find_user).to be_a User
      expect(find_user.id).to eq test_id
      expect(find_user.email).to eq 'test@test.com'
      expect(find_user.username).to eq 'tester123'
    end
    
    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do 
    it 'returns the user that matches the inputted email and password' do
      user = User.add(email: 'test@example.com', password: 'test123', username: 'Tester', name: 'test tester')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')
      expect(authenticated_user.id).to eq user.id
    end
  end  
end 
