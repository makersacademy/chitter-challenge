require './lib/user'
require 'bcrypt'

describe User do
  describe '.create' do
    it 'hashes the password' do
      expect(BCrypt::Password).to receive(:create).with('password')
      User.create(name: 'John Smith', username: 'jsmith', email: 'john@smith.com', password: 'password')
    end

    it 'creates a user' do
      user = User.create(name: 'John Smith', username: 'jsmith91', email: 'john@smith.com', password: 'password')

      expect(user.email).to eq('john@smith.com')
      expect(user.username).to eq('jsmith91')
      expect(user.name).to eq('John Smith')
    end
  end

  describe '.authenticate' do
    it "can find a user if the entered username matches" do
      user = User.create(name: 'John Smith', username: 'jsmith91', email: 'john@smith.com', password: 'password')
      authenticated_user = User.authenticate(username: 'jsmith91', password: 'password')
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil if incorrect username' do
      user = User.create(name: 'John Smith', username: 'jsmith91', email: 'john@smith.com', password: 'password')
      expect(User.authenticate(username: 'wrong_username', password: 'password')).to be_nil
    end

    it 'returns nil if incorrect password' do
      user = User.create(name: 'John Smith', username: 'jsmith91', email: 'john@smith.com', password: 'password')
      expect(User.authenticate(username: 'jsmith91', password: 'wrong_password')).to be_nil
    end
  end

  describe '.find' do
    it 'returns a user by id' do
      user = User.create(name: 'John Smith', username: 'jsmith91', email: 'john@smith.com', password: 'password')
      expect(User.find(user.id).username).to eq user.username
    end
  end

end