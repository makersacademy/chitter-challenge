require 'user'
require 'setup_test_database'

describe User do
  describe '.create' do
    it 'creates a new user' do
      setup_test_database
      PG.connect(dbname: 'peeps_test')
      new_user = User.create(name: 'Nazz Kadri', username: 'nazzk', email: 'test@example.com', password: 'password123')
      expect(new_user).to be_a(User)
      expect(new_user).to respond_to(:username)
      expect(new_user.email).to eq 'test@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(name: 'Test Name', username: 'Test', email: 'test@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      setup_test_database
      PG.connect(dbname: 'peeps_test')
      user = User.create(name: 'Nazz Kadri', username: 'nazzk', email: 'test@example.com', password: 'password123')
      result = User.find(user.username)
      expect(result.username).to eq user.username
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      setup_test_database
      PG.connect(dbname: 'peeps_test')
      user = User.create(name: 'Nazz Kadri', username: 'nazzk', email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')
      expect(authenticated_user.id).to eq user.id
    end
  end

  describe '.authenticate' do
    it 'returns nil given an incorrect email address' do
      setup_test_database
      PG.connect(dbname: 'peeps_test')
      user = User.create(name: 'Nazz Kadri', username: 'nazzk', email: 'test@example.com', password: 'password123')
      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end
  end

  describe '.authenticate' do
    it 'returns nil given an incorrect password' do
      setup_test_database
      PG.connect(dbname: 'peeps_test')
      user = User.create(name: 'Nazz Kadri', username: 'nazzk', email: 'test@example.com', password: 'password123')
      expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
    end
  end

end
