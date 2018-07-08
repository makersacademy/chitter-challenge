require 'user'

describe User do

  before(:each) do
    @user = User.create(name: 'Daniel', username: 'dlau',
       email: 'test@example.com', password: '123')
  end

  describe '.create' do
    it 'creates a new user' do
      expect(@user.id).not_to be_nil
    end
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@example.com', password: 'password123')
    end

  end

  describe '.all' do
    it 'returns all users, wrapped in a User instance' do
      expect(User.all.map(&:id)).to include @user.id
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      expect(User.find(@user.id).email).to eq @user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      authenticated_user = User.authenticate('test@example.com', '123')
      expect(authenticated_user.id).to eq @user.id
    end

    it 'returns nil given an incorrect email address' do
      expect(User.authenticate('nottherightemail@me.com', '123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      expect(User.authenticate('test@example.com', 'wrongpassword')).to be_nil
    end
  end
end
