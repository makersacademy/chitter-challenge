require './lib/user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123')

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password' do
      user = User.create(email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil if incorrect email' do
      user = User.create(email: 'test@example.com', password: 'password123')
      expect(User.authenticate(email: "wrongemail@example.com", password: "password123")).to be_nil
    end
  end

  describe '.create' do
    it 'does not create a new user if the email is not valid' do
      User.create(email: 'not a real email', password: 'not a real password')
      expect(User.all).to be_empty
    end
  end
end
