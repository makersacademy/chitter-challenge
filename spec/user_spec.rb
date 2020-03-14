# frozen_string_literal: true

require 'database_helpers'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123', username: 'Jane Doe', name: 'Jane')
  
      persisted_data = persisted_data(table: :users, id: user.id)
  
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
      expect(user.username).to eq 'Jane Doe'
      expect(user.name).to eq 'Jane'
    end
  
    # it 'raises an error if someone tries to sign in with an email that is already in use' do
    #   user = User.create(email: 'test@example.com', password: 'password123', username: 'Jane Doe', name: 'Jane')
    #   user = User.create(email: 'test@example.com', password: 'password123', username: 'John Doe', name: 'John')
  
    #   expect{subject.create}.to raise_error
    # end
  
    # it 'raises an error if someone tries to sign in with a username that is already in use' do
    #   user = User.create(email: 'test@example.com', password: 'password123', username: 'Jane Doe', name: 'Jane')
    #   user = User.create(email: 'test2@example.com', password: 'password123', username: 'Jane Doe', name: 'John')
  
    #   expect(page).not_to have_content "Welcome, John"
    # end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(email: 'test@example.com', password: 'password123', username: 'Jane Doe', name: 'Jane')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')
  
      expect(authenticated_user.id).to eq user.id
    end
  
    it 'returns nil given an incorrect email address' do
      User.create(email: 'test@example.com', password: 'password123', username: 'Jane Doe', name: 'Jane')
  
      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
  
      User.create(email: 'test@example.com', password: 'password123', username: 'Jane Doe', name: 'Jane')
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  
    it 'find a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123', username: 'Jane Doe', name: 'Jane')
      result = User.find(id: user.id)
  
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end

end
