require 'user'
require 'database_helpers'

describe User do

  describe '.create' do
    it 'hashes the password using BCrypt' do
      # connection = PG.connect(dbname: 'chitter_test')
      expect(BCrypt::Password).to receive(:create).with('hagrid123')
      User.create(username: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
    end

    it 'creates a new user' do
      # connection = PG.connect(dbname: 'chitter_test')
      user = User.create(username: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
      persisted_data = persisted_data(table: :users, id: user.id)
    
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.username).to eq('Hagrid')
      expect(user.email).to eq('hagrid@gmail.com')
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      # connection = PG.connect(dbname: 'chitter_test')
      user = User.create(username: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
      result = User.find(id: user.id)

      expect(result.id).to eq(user.id)
      expect(result.username).to eq(user.username)
      expect(result.email).to eq(user.email)
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do 
    it 'returns a user given a correct username and password, if one exists' do
      # connection = PG.connect(dbname: 'chitter_test')
      user = User.create(username: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
      authenticated_user = User.authenticate(email: 'hagrid@gmail.com', password: 'hagrid123')

      expect(authenticated_user.id).to eq(user.id)
    end

    it 'returns nil given an incorrect email address' do
      user = User.create(username: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'hagrid123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(username: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')
      expect(User.authenticate(email: 'hagrid@gmail.com', password: 'wrongpassword')).to be_nil
    end
  end

end