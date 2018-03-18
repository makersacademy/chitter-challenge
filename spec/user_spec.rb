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

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(
        email: 'test1233@example.com',
        password: 'password123',
        realname: 'Ace Ventura',
        username: '@jamesventura'
      )
      authenticated_user = User.authenticate('test1233@example.com', 'password123')

      expect(authenticated_user.id).to eq user.id
    end
  end

  describe '.authenticate' do
    it 'returns nil given an incorrect email address' do
      user = User.create(
        email: 'te0st@example.com',
        password: 'pa1ssword123',
        realname: 'james mclennon',
        username: '@jackson1'
      )

      expect(User.authenticate('nottherightemail@me.com', 'password123')).to be_nil
    end

    describe '.authenticate' do
      it 'returns nil given an incorrect password' do
        user = User.create(
          email: 'te123st@example.com',
          password: 'password123',
          realname: 'real name',
          username: '@nogimmicks'
      )

        expect(User.authenticate('te123st@example.com', 'wrongpassword')).to be_nil
      end
    end

  end

end
