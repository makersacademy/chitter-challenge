require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(username: 'a_user', firstname: 'Tom', lastname: 'Kellett', email: 'test@example.com', password: 'password123')

      expect(user).to be_a User
      expect(user.username).to eq 'a_user'
      expect(user.firstname).to eq 'Tom'
      expect(user.lastname).to eq 'Kellett'
      expect(user.email).to eq 'test@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(username: 'a_user', firstname: 'Tom', lastname: 'Kellett', email: 'test@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'returns the user' do
      user = User.create(username: 'a_user', firstname: 'Tom', lastname: 'Kellett', email: 'test@example.com', password: 'password123')

      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
    end
    
    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(username: 'a_user', firstname: 'Tom', lastname: 'Kellett', email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(username: 'a_user', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end
  end

  it 'returns nil given an incorrect email address' do
    user = User.create(username: 'a_user', firstname: 'Tom', lastname: 'Kellett', email: 'test@example.com', password: 'password123')

    expect(User.authenticate(username: 'wrong_username', password: 'password123')).to be_nil
  end

  it 'returns nil given an incorrect password' do
    user = User.create(username: 'a_user', firstname: 'Tom', lastname: 'Kellett', email: 'test@example.com', password: 'password123')

    expect(User.authenticate(username: 'a_user', password: 'wrongpassword')).to be_nil
  end
end
