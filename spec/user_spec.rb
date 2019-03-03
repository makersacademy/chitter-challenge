require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Simona', email: 'simona.gioe88@gmail.com', username: 'Airies', password: 'Password123')
      persisted_data = persisted_data(table: 'users',id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.name).to eq 'Simona'
      expect(user.email).to eq 'simona.gioe88@gmail.com'
      expect(user.username).to eq 'Airies'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('Password123')

      create_user
    end
  end

  describe '.find' do
    it 'returns the user' do
      user = User.create(name: 'Simona', email: 'simona.gioe88@gmail.com', username: 'Airies', password: 'Password123')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
      expect(result.username).to eq user.username
    end

    it 'returns nil if no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.find_by_email' do
    it 'returns nil if the email does not exist in the database' do
      result = User.find_by_email(email: 'peppino@gmail.com')

      expect(result.num_tuples.zero?).to be true
    end
  end

  describe '.find_by_username' do
    it 'returns nil if the username does not exist in the database' do
      result = User.find_by_username(username: 'blablabla')

      expect(result.num_tuples.zero?).to be true
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password' do
      user = User.create(name: 'Simona', email: 'simona.gioe88@gmail.com', username: 'Airies', password: 'Password123')
      authenticated_user = User.authenticate(email: 'simona.gioe88@gmail.com', password: 'Password123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user = User.create(name: 'Simona', email: 'simona.gioe88@gmail.com', username: 'Airies', password: 'Password123')

      expect(User.authenticate(email: 'nottherightemai@gmail.com', password: 'Password123')).to be nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(name: 'Simona', email: 'simona.gioe88@gmail.com', username: 'Airies', password: 'Password123')

      expect(User.authenticate(email: 'simona.gioe88@gmail.com', password: 'Nottherightpassword')).to be nil
    end
  end
end
