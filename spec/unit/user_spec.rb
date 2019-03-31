require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Amy Jordan', username: 'amy123', email: 'amy@testemail.com', password: 'password')

      expect(user).to be_a User
      expect(user.email).to eq 'amy@testemail.com'
      expect(user.name).to eq 'Amy Jordan'
      expect(user.username).to eq 'amy123'
    end

    it 'hashes the password with BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password')

      User.create(name: 'Amy Jordan', username: 'amy123', email: 'amy@testemail.com', password: 'password')
    end
  end

  describe '.find' do
    it 'find a user by ID' do
      user = User.create(name: 'Amy Jordan', username: 'amy123', email: 'amy@testemail.com', password: 'password')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
    end

    it 'returns nil if no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct name and password, if one exists' do
      user = User.create(name: 'Amy Jordan', username: 'amy123', email: 'amy@testemail.com', password: 'password')
      authenticated_user = User.authenticate(username: 'amy123', password: 'password')

      expect(authenticated_user.id).to eq user.id
    end
  end
end
