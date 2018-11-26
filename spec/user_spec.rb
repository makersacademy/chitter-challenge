require 'user'

describe User do
  let(:peep_class) { double(:peep_class) }

  describe '.list' do
    it 'returns all users' do

      connection = PG.connect(dbname: 'chitter_test')

      user = User.create(email: 'test@example.com', password: 'password123', name: 'testone de testini', username: 'zorro')
      User.create(email: 'test2@example.com', password: 'password124', name: 'test2', username: 'foxtrot')
      User.create(email: 'test3@example.com', password: 'password125', name: 'test3', username: 'tango')
      User.create(email: 'test4@example.com', password: 'password126', name: 'test4', username: 'sierra')

      users = User.list

      expect(users.length).to eq 4
      expect(users.first).to be_a User
      expect(users.first.id).to eq user.id
      expect(users.first.username).to eq 'zorro'
    end
  end

  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'testone de testini', username: 'zorro')
      expect(user).to be_a User
      expect(user.email).to eq 'test@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      user = User.create(email: 'test@example.com', password: 'password123', name: 'testone de testini', username: 'zorro')
    end
  end

  describe '.delete' do
    it 'Cancel a User account' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'testone de testini', username: 'zorro')
      User.delete(id: user.id)
      expect(User.list.length).to eq 0
    end
  end

  describe '.find' do
    it 'returns the user' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'testone de testini', username: 'zorro')
      result = User.find(id: user.id)
      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'testone de testini', username: 'zorro')
      authenticated_user = User.authenticate(username: 'zorro', password: 'password123')
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect username' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'testone de testini', username: 'zorro')
      expect(User.authenticate(username: 'nottherightusername', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'testone de testini', username: 'zorro')
      expect(User.authenticate(username: 'zorro', password: 'wrongpassword')).to be_nil
    end
  end

  describe '#peeps' do
    it 'calls .where on the Peep class' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'testone de testini', username: 'zorro')
      expect(peep_class).to receive(:where).with(user_id: user.id)
      user.peeps(peep_class)
    end
  end
end
