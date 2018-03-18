require 'user'

describe User do

  describe '.create' do
    it 'takes one argument' do
      expect(User).to respond_to(:create).with(1).argument
    end

    it 'creates a new user' do
      params = {
        name: 'Unit Test',
        username: 'UnitTest',
        email: 'unittest@test.com',
        password: 'unittest123'
      }

      user = User.create(params)
      expect(user.id).not_to be_nil
    end

    it 'hashes a password using bcrypt' do
      params = {
        name: 'Unit Test',
        username: 'UnitTest',
        email: 'unittest@test.com',
        password: 'unittest123'
      }

      expect(BCrypt::Password).to receive(:create).with('unittest123')
      User.create(params)
    end
  end

  describe '.all' do
    it 'returns all users, as a user instance' do
      params = {
        name: 'Unit Test',
        username: 'UnitTest',
        email: 'unittest@test.com',
        password: 'unittest123'
      }

      user = User.create(params)
      expect(User.all.map(&:id)).to include(user.id)
    end
  end

  describe '.find' do
    it 'finds a user by ID' do

      params = {
        name: 'Unit Test',
        username: 'UnitTest',
        email: 'unittest@test.com',
        password: 'unittest123'
      }

      user = User.create(params)

      expect(User.find(user.id).username).to eq(user.username)
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
end
