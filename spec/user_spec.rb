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
end
