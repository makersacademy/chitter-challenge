require 'user'
require_relative 'helper'

describe User do

  describe '#create' do
    it "should create a new User" do
      user = User.create(
          email: 'samm@makersacademy.com', 
          password: 'password123', 
          name: 'Sam Morgan',
          username: 'sjmog'
        )

      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'samm@makersacademy.com'
      expect(user.name).to eq 'Sam Morgan'
      expect(user.username).to eq 'sjmog'
    end

    it "should hash the password using BCrpyt" do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(
        email: 'samm@makersacademy.com', 
        password: 'password123', 
        name: 'Sam Morgan',
        username: 'sjmog'
      )
    end

  end

  describe '#find' do
    it "should find a user by id" do
      user = User.create(
          email: 'samm@makersacademy.com', 
          password: 'password123', 
          name: 'Sam Morgan',
          username: 'sjmog'
        )
        
      found_user = User.find(id: user.id)

      expect(found_user.id).to eq user.id
      expect(found_user.email).to eq user.email
      expect(found_user.name).to eq user.name
      expect(found_user.username).to eq user.username
    end

    it "should return nil if no id is given" do
      expect(User.find(id: nil)).to eq nil
    end

  end

  describe '#authenticate' do

    it 'should return an existing user given a correct username and password' do
      user = User.create(
        email: 'samm@makersacademy.com', 
        password: 'password123', 
        name: 'Sam Morgan',
        username: 'sjmog'
      )

      authenticated_user = User.authenticate(email: 'samm@makersacademy.com', password: 'password123')
  
      expect(authenticated_user.id).to eq user.id
    end

    it 'should return nil given an incorrect email address' do
      User.create(
          email: 'samm@makersacademy.com', 
          password: 'password123', 
          name: 'Sam Morgan',
          username: 'sjmog'
        )

      expect(User.authenticate(email: 'wrongeamail@makersacademy.com', password: 'password123')).to eq nil
    end

    it 'should return nil given an incorrect password' do
      User.create(
          email: 'samm@makersacademy.com', 
          password: 'password123', 
          name: 'Sam Morgan',
          username: 'sjmog'
        )

      expect(User.authenticate(email: 'samm@makersacademy.com', password: 'wrongpassword')).to eq nil
    end

  end

end
