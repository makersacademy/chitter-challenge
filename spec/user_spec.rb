require 'user'

describe User do

  describe '.create' do

      it 'creates a new user' do
        user= User.create(email: 'test@email.com', username: 'testusername', name: 'Test Name', password: 'Test Password')

        expect(user).to be_a User
      end
    end

  describe '.find' do
    it 'finds a user by ID' do

    user = User.create(email: 'test@email.com', username: 'testusername', name: 'Test Name', password: 'Test Password')
    result = User.find(id: user.id)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(email: 'test@example.com', password: 'password123', username: 'testusername', name: 'name')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user =  User.create(email: 'test@example.com', password: 'password123', username: 'testusername', name: 'name')

      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end
  end
end
