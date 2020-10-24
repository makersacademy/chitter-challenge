require 'database_helpers'
require 'model/user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@testing.com', password: 'password123')

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.email).to eq 'test@testing.com'
    end
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(email: 'test@testing.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'finds a user by their id' do
      user = User.create(email: 'test@testing.com', password: 'password123')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
    it 'returns nil if there is no id given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user object when given a correct username and password' do
      user = User.create(email: 'test@testing.com', password: 'password123')
      authenticated_user = User.authenticate(email: 'test@testing.com', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end
    it 'returns nil when given an incorrect username' do
      user = User.create(email: 'test@testing.com', password: 'password123')

      expect(User.authenticate(email: 'thewrongemail@failure.com', password: 'password123')).to be_nil
    end

    it 'returns nil when given an incorrect username' do
      user = User.create(email: 'test@testing.com', password: 'password123')

      expect(User.authenticate(email: 'test@testing.com', password: 'wrongpassword')).to be_nil
    end
  end

end
