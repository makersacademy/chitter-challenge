require './app/models/user'

describe User do
  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(
        :username => 'test',
        :email => 'test@example.com',
        :password => 'password123',
        :password_confirmation => 'password123',
        :name => 'password123'
      )
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      User.create(
        :username => 'test',
        :email => 'test@example.com',
        :password => 'password123',
        :password_confirmation => 'password123',
        :name => 'password123'
      )

      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      User.create(
        :username => 'test',
        :email => 'test@example.com',
        :password => 'password123',
        :password_confirmation => 'password123',
        :name => 'password123'
      )

      expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
    end
  end
end
