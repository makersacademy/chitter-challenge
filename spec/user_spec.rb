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
end
