require "user"

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        email: 'test@example.com',
        password: 'password123',
        username: '@testuser',
        realname: 'Testy McTyson'
      )

      expect(user.id).not_to be_nil
    end
  end

  describe '.all' do
    it 'returns all users, wrapped in a User instance' do
      user = User.create(email: 'test@example.com', password: 'password123')

      expect(User.all.map(&:id)).to include user.id
    end
  end

  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        email: 'Jonny@Bravo.com',
        password: 'password123',
        realname: 'Jonny Bravo',
        username: '@jbravoCN'
        )
      expect(user.id).not_to be_nil
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(
        email: 'bcrypt@example.com',
        password: 'password123',
        realname: 'Bcrypt Jacobs',
        username: '@bcryptinfo'
      )
    end

  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(
        email: 'test@example.com',
        password: 'password123',
        realname: 'testy tester',
        username: '@tester'
      )
      expect(User.find(user.id).email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end

  end

end
