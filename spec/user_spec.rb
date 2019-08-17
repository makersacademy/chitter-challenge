require 'user'
require 'message'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123')
      p "this is user for create #{user}"
      persisted_data = persisted_data(table: :users, id: user.id)
      p "this is presisted data for create #{persisted_data}" 
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
  
      User.create(email: 'test@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123')
      p user
      result = User.find(user.id)
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end
end