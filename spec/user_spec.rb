require 'user'

describe User do

  describe '#create' do
    it 'creates a new user' do
      user = User.create(name: "Test name", username: "Test username",
        email: "test@test.come", password: "password"
      )

      expect(user.name).to eq "Test name"
      expect(user.username).to eq "Test username"
      expect(user.email).to eq "test@test.come"
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(name: 'Test', username: 'Test',
        email: 'test@test.com', password: 'password123'
      )
    end
  end

  describe '#all' do
    it 'returns all users' do
      User.create(name: "Test name", username: "Test username",
        email: "test@test.com", password: "password"
      )
      User.create(name: "Test name 2", username: "Test username 2",
        email: "test2@test.com", password: "password2"
      )

      users = User.all

      expect(users.length).to eq 2
      expect(users[0]).to be_a User
      expect(users[0].name).to eq "Test name"
      expect(users[0].username).to eq "Test username"
      expect(users[0].email).to eq "test@test.com"
    end
  end

  describe '#find' do
    it 'finds a user by ID' do
      user = User.create(name: "Test name", username: "Test username",
        email: "test@test.com", password: "password"
      )
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.name).to eq "Test name"
      expect(result.username).to eq "Test username"
      expect(result.email).to eq "test@test.com"
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '#authenticate' do
    it 'returns a user if email and password are correct' do
      user = User.create(name: "Test name", username: "Test username",
        email: "test@test.com", password: "password"
      )
      authenticated_user = User.authenticate(email: "test@test.com", password: "password")

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user = User.create(name: "Test name", username: "Test username",
        email: "test@test.com", password: "password"
      )

      expect(User.authenticate(email: 'fake@test.com', password: 'password')).to eq nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(name: "Test name", username: "Test username",
        email: "test@test.com", password: "password"
      )

      expect(User.authenticate(email: 'test@test.com', password: 'wrongpassword')).to be_nil
    end
  end

end
