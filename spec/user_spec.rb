require 'database_helpers'
require 'user'

describe User do
  describe '.create' do
    it 'Creates a new user' do
      user = User.create(email: 'test@example.com',
        password: 'password', name: 'test', username: 'test123')
      persisted_data = persisted_data(id: user.id)
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
      expect(user.name).to eq 'test'
      expect(user.username).to eq 'test123'
    end
    it 'Encrypts the password using Bcrypt gem' do
      expect(BCrypt::Password).to receive(:create).with('password')
      user = User.create(email: 'test@example.com',
        password: 'password', name: 'test', username: 'test123')
    end
  end

  describe '.find' do
    it 'Finds a user by its ID' do
      user = User.create(email: 'test@example.com',
        password: 'password', name: 'test', username: 'test123')
      result = User.find(id: user.id)
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'Returns nil when there is no user in session' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'Returns a user if the email and password exists with an account' do
      user = User.create(email: 'test@example.com',
        password: 'password', name: 'test', username: 'test123')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password')
      expect(authenticated_user.id).to eq user.id
    end

    it 'Returns nil if the email is incorrect' do
      user = User.create(email: 'test@example.com',
        password: 'password', name: 'test', username: 'test123')
      expect(User.authenticate(email: 'wrongemail@example.com', password: 'password')).to be_nil
    end

    it 'Returns nil if given incorrect password' do
      user = User.create(email: 'test@example.com',
        password: 'password', name: 'test', username: 'test123')
      expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword'))
    end
  end
end
