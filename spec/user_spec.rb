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

    # Tests for unhappy paths

  end

  describe '.find' do
    it 'finds and retrieves a user from the database' do
      user = User.create(
        email: email,
        password: password,
        name: name,
        username: username
      )
      result = User.find(user.id)
      # At the moment, it's possible for duplicate usernames to exist
      # A username should be unique, this should be implemented later
      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
    end
  end

end
