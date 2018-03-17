require "user"

describe User do
  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(
        email: 'test@example.com',
        password: 'password123',
        username: '@testuser',
        realname: 'Testy McTyson'
      )

      expect(User.find(user.id).email).to eq user.email
    end
  end

end
