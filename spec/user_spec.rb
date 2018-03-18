require "user"

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        email: 'test@example.com',
        password: 'password123',
        username: '@testuser',
        realname: 'Testy McTyson'
      )

      expect(user.id).not_to be_nil
    end
  end
  
  describe '.all' do
    it 'returns all users, wrapped in a User instance' do
      user = User.create(email: 'test@example.com', password: 'password123')

      expect(User.all.map(&:id)).to include user.id
    end
  end

end
