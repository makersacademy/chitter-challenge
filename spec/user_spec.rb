require 'user'
require 'database_helper'

describe User do
  describe 'Create' do
    it 'creates a new user' do
      user = User.create(name: 'name', email: 'sam@example.com', password: 'password123')

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'sam@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(name: 'name', email: 'sam@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end

    it 'finds a user by ID' do
      user = User.create(name: 'Sam', email: 'sam@example.com', password: 'password123')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.name).to eq user.name
    end
  end

  describe '.authenticate' do
    # it 'returns a user given a correct username and password, if one exists' do
    #   user = User.create(name: 'Sam', email: 'sam@example.com', password: 'password123')
    #   authenticated_user = User.authenticate(email: 'sam@example.com', password: 'password123')
    #   expect(authenticated_user.email).to eq('sam@example.com')
    # end

    it 'returns nil given an incorrect email addres' do
      expect(User.authenticate(email: 'nottheiremil.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      expect(User.authenticate(email: 'sam@example.com', password: 'password123')).to be_nil
    end
  end
end
