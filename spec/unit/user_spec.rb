require 'user'
require 'database_helpers'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'jess@test.com', password: 'abcdef', handle: 'jesstest')

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'jess@test.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password')

      User.create(email: 'jess@test.com', password: 'password', handle: 'jesstest')
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'jess@test.com', password: 'abcdef', handle: 'jesstest')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq 'jess@test.com'
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password' do
      user = User.create(email: 'jess@test.com', password: 'abcdef', handle: 'jesstest')
      authenticated_user = User.authenticate('jess@test.com', 'abcdef')

      expect(authenticated_user.id).to eq user.id
    end
  end
end
