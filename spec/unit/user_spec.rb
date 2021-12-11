require 'user'
require 'bcrypt'

describe User do
  describe '.create' do
    it 'creates a user with a name and password' do
      user = User.create(username: 'Sherwin', password: 'test123')
      
      expect(user.username).to eq 'Sherwin'
    end

    it 'hashes password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('test123')

      User.create(username: 'Sherwin', password: 'test123')
    end

    it 'returns true when given a new user' do
      user = User.create(username: 'Sherwin', password: 'test123')
      expect(User.unique?(user)).to be_truthy
    end

    it 'returns false when given an existing user' do
      user = User.create(username: 'Sherwin', password: 'test123')
      user = User.create(username: 'Sherwin', password: 'test123')
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(username: 'Sherwin', password: 'test123')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
    end

    it 'returns nil if no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
  
  describe '.authenticate' do
    it 'returns a user when given a valid user' do
      user = User.create(username: 'Sherwin', password: 'test123')
      authenticated_user = User.authenticate(username: 'Sherwin', password: 'test123')
      expect(authenticated_user.id).to eq(user.id)
    end

    it 'returns nil when given an invalid username' do
      User.create(username: 'Sherwin', password: 'test123')
      expect(User.authenticate(username: 'wrong user', password: 'test123')).to eq nil
    end

    it 'returns nil when given an invalid password' do
      User.create(username: 'Sherwin', password: 'test123')
      expect(User.authenticate(username: 'Sherwin', password: 'wrong password')).to eq nil
    end
  end
end
