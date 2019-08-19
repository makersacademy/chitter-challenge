require 'user'

describe User do
  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'example@lycos.com', password: 'fakepassword')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no id given' do
      expect(User.find(nil)).to eq nil

    end
  end

  describe '.create' do
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('fakepassword')

      User.create(email: 'example@lycos.com', password: 'fakepassword')
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')
  
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user = User.create(email: 'example@lycos.com', password: 'realpassword')
  
      expect(User.authenticate(email: 'example@yahoo.com', password: 'realpassword')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(email: 'test@example.com', password: 'password123')
  
      expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
    end
  end
end
