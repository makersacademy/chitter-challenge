require 'user'
require 'bcrypt'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = described_class.create(email: 'test@example.com', password: 'password123', name: 'testname', username: 'username')
      expect(user.id).not_to eq nil
      expect(user.email).to eq "test@example.com"
      expect(user.name).to eq "testname"
      expect(user.username).to eq "username"
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      described_class.create(email: 'test@example.com', password: 'password123', name: 'testname', username: 'username')
    end
  end

  describe '.find' do

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end

    it 'finds a user by ID' do
      user = described_class.create(email: 'test@example.com', password: 'password123', name: 'testname', username: 'username')
      result = described_class.find(user.id)
      expect(result.email).to eq user.email
      expect(result.id).to eq user.id
      expect(result.password).to eq user.password
    end
  end
end