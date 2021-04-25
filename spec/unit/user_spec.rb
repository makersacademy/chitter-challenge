require 'user'

describe User do
  context '#initialize' do
    it 'has a username'do
      user = User.create(username: "testname", password: "password")
      expect(user.username).to eq "testname"
    end

    it 'has an id'do
      user = User.create(username: "testname", password: "password")
      expect(user.id).to eq user.id
    end
  end

  context '.create' do
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
  
      User.create(username: 'testname', password: 'password123')
    end
  end

  context'.authentication' do
    it 'authenticates a user' do
      user = User.create(username: 'testname', password: 'password123')
      authenticated_user = User.authentication(username: 'testname', password: 'password123')
  
      expect(authenticated_user.id).to eq user.id
    end

    it 'does not authenticate incorrect email' do
      user = User.create(username: 'testname', password: 'password123')
  
      expect(User.authentication(username: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end

    it 'does not authenticate incorrect password' do
      user = User.create(username: 'testname', password: 'password123')
  
      expect(User.authentication(username: 'testname', password: 'wrongpassword')).to be_nil
    end
  end
end