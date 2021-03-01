require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
      persisted_data = persisted_user_data(id: user.id)
      expect(persisted_data['email']).to eq('bobloblaw@lawblog.com')
      expect(persisted_data['name']).to eq('Bob Loblaw')
      expect(persisted_data['username']).to eq('bloblaw')
    end
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('bobloblawslawblog')
      User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
    end
    it 'does not create a user if username is already taken' do
      User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
      expect(User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'blobbylaw')).to be_nil
    end
    it 'does not create a user if email is already taken' do
      User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
      expect(User.create(email: 'bobbyloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')).to be_nil
    end
  end
  describe '.find' do
    it 'finds a user' do
      user = User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
      persisted_data = persisted_user_data(id: user.id)
      result = User.find(id: persisted_data['id'])
      expect(result.name).to eq('Bob Loblaw')
      expect(result.username).to eq('bloblaw')
    end
  end
  describe '.authenticate' do
    it 'returns a user if a user exists with those password and email credentials' do
      User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
      auth_user = User.authenticate(username: 'bloblaw', password: 'bobloblawslawblog')
      expect(auth_user).to be_a User
      expect(auth_user.email).to eq('bobloblaw@lawblog.com')
      expect(auth_user.name).to eq('Bob Loblaw')
    end
    it 'returns nil if no user exists with that username' do
      User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
      expect(User.authenticate(username: 'carlweathers', password: 'bobloblawslawblog')).to be_nil
    end
    it 'returns nil if that password does not match user record' do
      User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
      expect(User.authenticate(username: 'goblaw', password: 'carlweathers')).to be_nil
    end
  end
end
