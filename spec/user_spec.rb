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
end