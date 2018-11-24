require 'user'
require 'database_helpers.rb'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        name: 'Test User',
        email: 'test@email.com',
        username: 'test username',
        password: 'password123'
      )
      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.username).to eq 'test username'
      expect(user.email).to eq 'test@email.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(
        name: 'Test User',
        email: 'test@email.com',
        username: 'test username',
        password: 'password123'
      )
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end

    it 'returns a user from the db' do
      user = User.create(
        name: 'Test User',
        email: 'test@email.com',
        username: 'test username',
        password: 'password123'
      )
      persisted_data = persisted_data(table: :users, id: user.id)

      found_user = User.find(id: user.id)

      expect(found_user.id).to eq persisted_data['id']
      expect(found_user.username).to eq user.username
    end
  end

  describe '.all' do
    it 'returns all the users' do
      user = User.create(
        name: 'Test User',
        email: 'test@email.com',
        username: 'test username',
        password: 'password123'
      )

      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM users WHERE id = #{user.id}")
      expect(user.id).to eq persisted_data.first['id']
      expect(user.name).to eq persisted_data.first['name']
      expect(user.username).to eq persisted_data.first['username']
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(
        name: 'Test User',
        email: 'test@email.com',
        username: 'test username',
        password: 'password123'
      )
      authenticated_user = User.authenticate(email: 'test@email.com', password: 'password123')
      expect(authenticated_user.id).to eq user.id
    end

    it 'retuns nil for an incorrect email' do
      User.create(
        name: 'Test User',
        email: 'test@email.com',
        username: 'test username',
        password: 'password123'
      )
      expect(User.authenticate(email: 'blah@notanemaik.com', password: 'password123')).to be_nil
    end

    it 'retuns nil for an incorrect password' do
      User.create(
        name: 'Test User',
        email: 'test@email.com',
        username: 'test username',
        password: 'password123'
      )
      expect(User.authenticate(email: 'test@email.com', password: 'notrightpassword')).to be_nil
    end
  end

end
