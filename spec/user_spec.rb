require 'user'
require 'database_connection'

describe User do
  before(:each) do
    DatabaseConnection.query("TRUNCATE users")
  end
  describe '.create' do
    it "should create a new user" do
      expect(User.create(username: 'tim456', name: 'tim james', email: 'tim@gmail.com', password: '42jk3l4j2l').username).to eq('tim456')
    end
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
  
      User.create(username: 'test456', name: 'test guy', email: 'test@example.com', password: 'password123')
    end
  end
  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(username: 'test456', name: 'test guy', email: 'test@example.com', password: 'password123')
      result = User.find(user.id)
  
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(username: 'test1234567', name: 'test guy', email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(username: 'test1234567', password: 'password123')
  
      expect(authenticated_user.username).to eq user.username
    end
    it 'returns nil given an incorrect email address' do
      user = User.create(username: 'test42342432', name: 'test guy', email: 'test@example.com', password: 'password123')
  
      expect(User.authenticate(username: 'nottherightguy', password: 'password123')).to be_nil
    end
    it 'returns nil given an incorrect password' do
      User.create(username: 'testerguy', name: 'test guy', email: 'test@example.com', password: 'password123')
  
      expect(User.authenticate(username: 'testerguy', password: 'wrongpassword')).to be_nil
    end
  end
  
end