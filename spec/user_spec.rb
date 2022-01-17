require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Bob', username: 'BobBamBoom', email: 'Bob@example.com', password: 'Banana123')

      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.username).to eq 'BobBamBoom'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('Banana123')
      User.create(name: 'Bob', username: 'BobBamBoom', email: 'Bob@example.com', password: 'Banana123')
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(name: 'Bob', username: 'BobBamBoom', email: 'Bob@example.com', password: 'Banana123')
      result = User.find(user.id)
  
      expect(result.id).to eq user.id
      expect(result.username).to eq 'BobBamBoom'
    end
  end

  describe '.authenticate' do
    context 'user exists and gives the correct email and password' do
      it 'returns the user' do
        user = User.create(name: 'Bob', username: 'BobBamBoom', email: 'Bob@example.com', password: 'Banana123')
        authenticated_user = User.authenticate(email: 'Bob@example.com', password: 'Banana123')
    
        expect(authenticated_user.id).to eq user.id
      end
    end

    context 'user gives a non-existent email' do
      it 'returns nil' do
        user = User.create(name: 'Bob', username: 'BobBamBoom', email: 'Bob@example.com', password: 'Banana123')

        expect(User.authenticate(email: 'Bib@exomple.com', password: 'Banana123')).to be_nil
      end
    end

    context 'user gives an incorrect passowrd' do
      it 'returns nil' do
        user = User.create(name: 'Bob', username: 'BobBamBoom', email: 'Bob@example.com', password: 'Banana123')

        expect(User.authenticate(email: 'Bob@example.com', password: 'Orange123')).to be_nil
      end
    end
  end
end
