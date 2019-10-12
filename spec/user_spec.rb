require 'user'

describe User do

  let(:email) { 'test@example.com' }
  let(:password) { 'pass123' }
  let(:name) { 'Melvin Lau' }
  let(:username) { 'melvinlau' }

  describe '.create' do

    it 'creates a new user' do
      user = User.create(
        email: email,
        password: password,
        name: name,
        username: username
      )
      result = DBConnection.query("SELECT * FROM users WHERE id = '#{user.id}';")
      expect(user).to be_a User
      expect(user.id).to eq result[0]['id']
      expect(user.username).to eq result[0]['username']
    end

    it 'encrypts the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with(password)
      User.create(
        email: email,
        password: password,
        name: name,
        username: username
      )
    end

    it 'returns appropriate message if user attempts to register an existing email' do
      User.create(
        email: email,
        password: password,
        name: name,
        username: username
      )
      user = User.create(
        email: email,
        password: password,
        name: name,
        username: 'another_username'
      )
      expect(user).to eq 'Email exists'
    end

    it 'returns appropriate message if user attempts to register an existing username' do
      User.create(
        email: email,
        password: password,
        name: name,
        username: username
      )
      user = User.create(
        email: 'another@example.com',
        password: password,
        name: name,
        username: username
      )
      expect(user).to eq 'Username exists'
    end

  end

  describe '.authenticate' do
    it 'logs the user in if the correct email and password are given' do
      user = User.create(
        email: email,
        password: password,
        name: name,
        username: username
      )
      authenticated_user = User.authenticate(email: email, password: password)
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil if incorrect email given' do
      user = User.create(
        email: email,
        password: password,
        name: name,
        username: username
      )
      authenticated_user = User.authenticate(email: 'wrong_email', password: password)
      expect(authenticated_user).to be_nil
    end

    it 'returns nil if incorrect password given' do
      user = User.create(
        email: email,
        password: password,
        name: name,
        username: username
      )
      authenticated_user = User.authenticate(email: email, password: 'wrong password')
      expect(authenticated_user).to be_nil
    end

  end

  describe '.find' do

    before(:each) do
      User.create(
        email: email,
        password: password,
        name: name,
        username: username
      )
    end

    it 'searches the user database by email and returns any matches' do
      result = User.find(by: 'email', term: email)
      expect(result.email).to eq email
    end

    it 'returns nil if no matches by email are found' do
      result = User.find(by: 'email', term: 'nonexistent@example.com')
      expect(result).to eq nil
    end

    it 'searches the user database by username and returns any matches' do
      result = User.find(by: 'username', term: username)
      expect(result.username).to eq username
    end

    it 'returns nil if no matches by username are found' do
      result = User.find(by: 'username', term: 'nonexistent_user')
      expect(result).to eq nil
    end

  end

end
