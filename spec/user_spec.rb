require_relative '../lib/user.rb'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create('horus', 'Horus Lupercal', 'test@test.com', 'password123')
      expect(user.username).to eq('horus')
    end
    it 'creates a hashed password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create('horus', 'Horus Lupercal', 'test@test.com', 'password123')
    end
  end
  describe '.all' do
    it 'returns an array of user instances' do
      user = User.create('horus', 'Horus Lupercal', 'test@test.com', 'password123')
      expect(User.all).to include user
    end
  end
  describe '.retrieve' do
    it 'returns a user instance from their id' do
      user1 = User.create('horus', 'Horus Lupercal', 'test@test.com', 'password123')
      user2 = User.retrieve(user1.id)
      expect(user1).to eq user2
    end
  end
end
