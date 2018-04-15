require './app/lib/user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Dave Test', username: 'test_user1')

      expect(user.id).not_to be_nil
    end

    it 'hashes the password uding BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@example.com', password: 'password123')
    end
  end

  describe '.all' do
    it 'returns all users, wrapped in a User instance' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Dave Test', username: 'test_user1')

      expect(User.all.map(&:id)).to include user.id

    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Dave Test', username: 'test_user1')

      expect(User.find(user.id).username).to eq user.username
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given the correct username and password' do
      user = User.create(email: 'test1@example.com', password: 'password123', name: 'Jim Test', username: 'test_user2')
      authenticated_user = User.authenticate('test1@example.com', 'password123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user = User.create(email: 'test2@example.com', password: 'password123', name: 'Jim Jones', username: 'test_user3')

      expect(User.authenticate('nottherightemail@me.com', 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(email: 'test3@example.com', password: 'password123', name: 'Jim Smith', username: 'test_user4')

      expect(User.authenticate('test3@example.com', 'password_1')).to be_nil

    end
  end
end
