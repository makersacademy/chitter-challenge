require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'cat@email.com', password: 'password123', name: 'Cat', username: 'catty')
      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'cat@email.com'
      expect(user.name).to eq 'Cat'
      expect(user.username).to eq 'catty'
    end

    it 'uses BCrypt to hash the password' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(email: 'cat@email.com', password: 'password123', name: 'Cat', username: 'catty')
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'cat@email.com', password: 'password123', name: 'Cat', username: 'catty')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
      expect(result.name).to eq user.name
      expect(result.username).to eq user.username
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user when the correct email and password are entered' do
      user = User.create(email: 'cat@email.com', password: 'password123', name: 'Cat', username: 'catty')
      authenticated_user = User.authenticate(email: 'cat@email.com', password: 'password123')
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil if given an incorrect email address' do
      User.create(email: 'cat@email.com', password: 'password123', name: 'Cat', username: 'catty')
      expect(User.authenticate(email: 'cate@email.com', password: 'password123')).to be_nil
    end

    it 'returns nil if given an incorrect password' do
      User.create(email: 'cat@email.com', password: 'password123', name: 'Cat', username: 'catty')
      expect(User.authenticate(email: 'cat@email.com', password: 'password')).to be_nil
    end
  end
end
