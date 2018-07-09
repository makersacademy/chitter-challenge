require 'user'

describe User do
  describe '.add' do
    it 'add user information' do
      user =  User.add('test', 'jeff', 'test@gmail.com', 'test123')
      expect(User.all).to include user
    end
  end
end
