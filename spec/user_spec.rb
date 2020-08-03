require 'user'
require 'database_helpers'

describe User do

  describe '.all' do
    it 'returns a list of users' do
      user = create_user
      users = User.all
      
      expect(users.length).to eq 1
      expect(users.first).to be_a User
      expect(users.first.id).to eq user.id
      expect(user.username).to eq 'FirstAuthor'
      expect(user.email).to eq 'test@makers.com'
    end
  end
  
  describe '.create' do
    it 'adds a new user to the database' do
      user = create_user
      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.username).to eq 'FirstAuthor'
      expect(user.email).to eq 'test@makers.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      create_user
    end
  end

  describe '.find' do

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end

    it 'finds a user by ID' do
      user = create_user
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
      expect(result.email).to eq user.email
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct email and password, if one exists' do
      user = create_user
      authenticated_user = User.authenticate(
        email: 'test@makers.com',
        password: 'password123'
      )

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil if no user account has provided email' do
      create_user
      authenticated_user = User.authenticate(
        email: 'wrongemail@makers.com',
        password: 'password123'
      )
      expect(authenticated_user).to be_nil
    end

    it 'returns nil if user has provided incorrect password' do
      create_user
      authenticated_user = User.authenticate(
        email: 'test@makers.com',
        password: 'wrongpassword'
      )
      expect(authenticated_user).to be_nil
    end
  end
end
