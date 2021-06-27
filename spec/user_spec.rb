require 'user'
require 'database_helpers'

describe User do
  let(:peep_class) { double(:peep_class) }

  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')

      persisted_data = persisted_data(table: 'users', id: user.user_id)

      expect(user).to be_a User
      expect(user.user_id).to eq persisted_data.first['user_id']
      expect(user.email).to eq 'test@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')
    end

    it 'does not create a new user if the username is not unique' do
      User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')
      user = User.create(email: 'test2@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')

      expect(user).not_to be_a User
    end

    it 'does not create a new user if the email is not unique' do
      User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser2')

      expect(user).not_to be_a User
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')
      result = User.find(user_id: user.user_id)

      expect(result.user_id).to eq user.user_id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(user_id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')

      expect(authenticated_user.user_id).to eq user.user_id
    end

    it 'returns nil given an incorrect email address' do
      User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')

      expect(User.authenticate(email: 'incorrect_email@example.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')

      expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
    end
  end

  describe '#peeps' do
    it 'calls .who on the peep class' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')
      expect(peep_class).to receive(:who).with(user_id: user.user_id)

      user.peeps(peep_class)
    end

  end
end
