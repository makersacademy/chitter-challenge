require 'user'
require 'bcrypt'

describe User do
  let (:user) { described_class.create(email: 'test@example.com', password: 'password123', name: 'testname', username: 'username') }
  let (:result) { described_class.find(user.id) }
  authenticated_user = described_class.authenticate(email: 'test@example.com', password: 'password123')
  describe '.create' do
    it 'creates a new user' do
      expect(user.id).not_to eq nil
      expect(user.email).to eq "test@example.com"
      expect(user.name).to eq "testname"
      expect(user.username).to eq "username"
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      described_class.create(email: 'test@example.com', password: 'password123', name: 'testname', username: 'username')
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end

    it 'finds a user by ID' do
      expect(result.email).to eq user.email
      expect(result.id).to eq user.id
      expect(result.password).to eq user.password
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user      
      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user
      expect(User.authenticate(email: 'test@test.com', password: 'wrongpassword')).to be_nil
    end
  end
end
