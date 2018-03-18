require 'user'

describe User do
  before :all do
    @params = {
      name: 'Unit Test',
      username: 'UnitTest',
      email: 'unittest@test.com',
      password: 'unittest123'
    }
  end

  describe '.create' do
    it 'takes one argument' do
      expect(User).to respond_to(:create).with(1).argument
    end

    it 'creates a new user' do
      user = User.create(@params)
      expect(user.id).not_to be_nil
    end

    it 'hashes a password using bcrypt' do
      expect(BCrypt::Password).to receive(:create).with('unittest123')
      User.create(@params)
    end
  end

  describe '.all' do
    it 'returns all users, as a user instance' do
      user = User.create(@params)
      expect(User.all.map(&:id)).to include(user.id)
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(@params)
      expect(User.find(user.id).username).to eq(user.username)
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user object if user exists' do
      user = User.create(@params)
      authenticated_user = User.authenticate(@params[:email], @params[:password])

      expect(authenticated_user.id).to eq(user.id)
    end

    it 'returns nil if given an incorrect email address' do
      User.create(@params)
      expect(User.authenticate('notaemail@test.com', @params[:password])).to be_nil
    end

    it 'returns nil if given an incorrect password' do
      User.create(@params)
      expect(User.authenticate(@params[:email], 'incorrectpassword')).to be_nil
    end
  end
end
