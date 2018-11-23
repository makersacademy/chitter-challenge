require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Aga', username: 'Agausername', email: 'test@example.com', password: 'password123')
      persisted_data = persisted_data(id: user.id, table: 'users')
      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.name).to eq 'Aga'
      expect(user.username).to eq 'Agausername'
      expect(user.email).to eq 'test@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(name: 'Aga', username: 'Agausername', email: 'test@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'can find user by id' do
      user = User.create(name: 'Aga', username: 'Agausername', email: 'test@example.com', password: 'password123')
      new_user = User.find(id: user.id)

      expect(user.name).to eq(new_user.name)
      expect(user.username).to eq(new_user.username)
      expect(user.email).to eq(new_user.email)
    end
    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end
end
