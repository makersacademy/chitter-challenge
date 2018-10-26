require 'user'

describe User do

  describe '#create' do
    it 'creates a new user' do
      user = User.create(name: "Test name", username: "Test username",
        email: "test@test.come", password: "password"
      )

      expect(user.name).to eq "Test name"
      expect(user.username).to eq "Test username"
      expect(user.email).to eq "test@test.come"
    end
  end

  describe '#all' do
    it 'returns all users' do
      User.create(name: "Test name", username: "Test username",
        email: "test@test.com", password: "password"
      )
      User.create(name: "Test name 2", username: "Test username 2",
        email: "test2@test.com", password: "password2"
      )

      users = User.all

      expect(users.length).to eq 2
      expect(users[0]).to be_a User
      expect(users[0].name).to eq "Test name"
      expect(users[0].username).to eq "Test username"
      expect(users[0].email).to eq "test@test.com"
    end
  end

  describe '#find' do
    it 'finds a user by ID' do
      user = User.create(name: "Test name", username: "Test username",
        email: "test@test.com", password: "password"
      )
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.name).to eq "Test name"
      expect(result.username).to eq "Test username"
      expect(result.email).to eq "test@test.com"
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

end
