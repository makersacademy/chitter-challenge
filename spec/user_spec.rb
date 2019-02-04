require 'user'
require_relative 'features/web_helpers'

describe User do

  describe '.add_new' do
    it 'creates a new user' do
      user = User.add_new(name: 'TestName', email: 'test@example.com', password: 'password123')

      persisted_data = persisted_data(id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.add_new(name: 'TestName', email: 'test@example.com', password: 'password123')
      result = User.find(id: user)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.find_or_create_anon_user' do

    it 'should find user by name' do
      expect(User.find_or_create_anon_user.name).to eq "Anonymous"
    end

    it 'should create anon user if none exists' do
      user = User.add_new(name: 'Anonymous', email: 'anon', password: 'anon')
      expect(User.find_or_create_anon_user.name).to eq "Anonymous"
    end
  end

end
