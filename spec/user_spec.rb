require_relative '../lib/user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        name: 'John Doe',
        username: 'JD99',
        email: 'JDoe99@example.com',
        password: 'Password123'
      )

      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.name).to eq 'John Doe'
      expect(user.username).to eq 'JD99'
      expect(user.email).to eq 'JDoe99@example.com'
      # expect(user.password).to eq 'Password123'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('Password123')
      user = User.create(
        name: 'John Doe',
        username: 'JD99',
        email: 'JDoe99@example.com',
        password: 'Password123'
      )
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(
        name: 'John Doe',
        username: 'JD99',
        email: 'JDoe99@example.com',
        password: 'Password123'
      )

      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.name).to eq user.name
      expect(result.username).to eq user.username
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
end
