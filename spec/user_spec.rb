require 'user'

RSpec.describe '.create' do
  it 'creates a new user' do
    connection = PG.connect(dbname: 'chitter_test')
    user = User.create(email: "test@example.com", password: "password123", username: "test12")

    users = connection.exec("SELECT * FROM users WHERE id = $1;", [user.id])

    expect(user).to be_a User
    expect(user.id).to eq users.first['id']
    expect(user.email).to eq 'test@example.com'
    expect(user.username).to eq 'test12'
  end

  it "hashes the password using BCrypt" do
    expect(BCrypt::Password).to receive(:create).with('password123')
    User.create(email: 'test@example.com', password: 'password123', username: 'test12')
  end
end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123', username: 'test12')
      result = User.find(id: user.id)
  
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
      expect(result.username).to eq user.username
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct email and password, if one exists' do
      user = User.create(email: 'bill@example.com', password: 'password123', username: 'bill12')
      authenticated_user = User.authenticate(email: 'bill@example.com', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end
  end