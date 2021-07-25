require 'user'
require_relative 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'example@example.co.uk', password: 'password123')
      persisted_data = persisted_data(table: :users, id: user.id)
      expect(user).to be_a User
      expect(user.id).to eq(persisted_data.first['id'])
      expect(user.email).to eq 'example@example.co.uk'
    end
    it 'uses BCrypt to scramble password' do
      expect(BCrypt::Password).to receive(:create).with('password')

      User.create(email: 'example@example.co.uk', password: 'password')
    end
  end

  describe '.find' do
    it 'returns the user' do
      user = User.create(email: 'test@example.com', password: 'password123')

      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given the right name and password' do
      user = User.create(email: 'example@example.com', password: 'password')
      auth_user = User.authenticate(email: 'example@example.com', password: 'password')

      expect(auth_user.id).to eq user.id
    end
    it 'returns nil if email doesnt exist' do
      User.create(email: 'example@example.com', password: 'password')
      expect(User.authenticate(email: 'wrongemail@email.com', password:'password')).to eq nil
    end
  end
end
