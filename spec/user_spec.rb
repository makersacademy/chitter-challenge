require 'user'

describe User do
  describe '#.create' do
    it 'creates a new user' do
      user = User.create('ollie@gmail.com', 'password123')
      expect(user).to be_a User
    end
  end
end
