require 'user'

describe User do
  describe '.create' do
    it 'creates a user with a name and password' do
      user = User.create(username: 'Sherwin', password: 'test123')
      
      expect(user.username).to eq 'Sherwin'
      expect(user.password).to eq 'test123'
    end
  end
end