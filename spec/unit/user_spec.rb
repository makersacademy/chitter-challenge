require 'user'

describe User do
  describe '.create' do
    it 'creates a user with a name and password' do
      user = User.create(username: 'Sherwin', password: 'test123')
      
      expect(user.username).to eq 'Sherwin'
      expect(user.password).to eq 'test123'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(username: 'Sherwin', password: 'test123')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
    end

    it 'returns nil if no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
end