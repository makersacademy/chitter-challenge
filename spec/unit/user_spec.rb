require 'user'

describe User do
  describe '.create' do
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create('test1@example.com', 'password123', 'test1', 'test1')
    end

    it 'creates a new user' do
      user = User.create('test2@example.com', 'password123', 'test2', 'test2')
      # persisted_data = persisted_data(user, user.id)
      expect(user).to be_a User
      # expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test2@example.com'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create('test3@example.com', 'password123', 'test3', 'test3')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.sign_in' do
    it 'returns a user give correct email and password' do
      user = User.create('test4@example.com', 'password1234', 'test4', 'test4')
      auth_user = User.sign_in('test4@example.com', 'password1234')

      expect(auth_user.id).to eq user.id
    end

    it 'returns nil with wrong email' do
      User.create('test5@example.com', 'password123', 'test5', 'test5')
      expect(User.sign_in('notrightemail@example.com', 'password123')).to be_nil
    end

    it 'returns nil with wrong email' do
      User.create('test6@example.com', 'password123', 'test6', 'test6')
      expect(User.sign_in('test6@example.com', 'wrongpass')).to be_nil
    end
  end

  describe '.all' do
    it 'returns all users' do
      expect(User.all.first).to be_a User
    end
  end
end
