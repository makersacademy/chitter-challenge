require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
    user = User.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')

    expect(user.id).not_to be_nil
    end
  end

  describe '.all' do
    it 'returns all users, wrapped in a User instance' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')

      expect(User.all.map(&:id)).to include user.id
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test name', username: 'testusername')

      expect(User.find(user.id).email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
end
