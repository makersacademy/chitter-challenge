require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        email: 'test1@example.com',
        password: 'password123',
        name: 'Example Name',
        username: '@example_user1'
      )
      persisted_data = persisted_data(id: user.id, table: 'users')

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test1@example.com'
      expect(user.name).to eq 'Example Name'
      expect(user.username).to eq '@example_user1'
    end

    xit 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(
        email: 'test1@example.com',
        password: 'password123',
        name: 'Example Name',
        username: '@example_user1'
      )
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end

    it 'finds a user by ID' do
      user = User.create(
        email: 'test2@example.com',
        password: 'password123',
        name: 'Example Name',
        username: '@example_user2'
      )

      found_user = User.find(id: user.id)

      expect(found_user.id).to eq user.id
      expect(found_user.email).to eq user.email
      expect(found_user.name).to eq user.name
      expect(found_user.username).to eq user.username
    end 
  end

  describe '.authenticate' do
    it 'returns a user if details exist and are correct' do
      user = User.create(
        email: 'test5@example.com',
        password: 'password123',
        name: 'Test Example',
        username: '@test_user5'
      )

      authenticated_user = User.authenticate(email: 'test5@example.com', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil if email is incorrect' do
      user = User.create(
        email: 'test7@example.com',
        password: 'password123',
        name: 'Test Example',
        username: '@test_user7'
      )

      expect(User.authenticate(email: 'wrongemail@incorrect.com', password: 'password123')).to be_nil
    end

    it 'returns nil if password is incorrect' do
      user = User.create(
        email: 'test9@example.com',
        password: 'password123',
        name: 'Test Example',
        username: '@test_user9'
      )

      expect(User.authenticate(email: 'test9@example.com', password: 'wrongpassword')).to be_nil
    end
  end 
end