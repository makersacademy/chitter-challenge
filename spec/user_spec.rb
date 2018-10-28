require 'user'

describe User do

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO users (name, email, username, password) VALUES ('RaySmith', 'ray@smith.com', 'RayRay', 'ray123');")
      connection.exec("INSERT INTO users (name, email, username, password) VALUES ('SteveSmith', 'steve@smith.com', 'Stevo', 'steve123');")
      # user = User.create(name: 'RaySmith', email: 'ray@smith.com', username: 'RayRay', password: 'ray123')
      # user = User.create(name: 'SteveSmith', email: 'steve@smith.com', username: 'Stevo', password: 'Steve123')

      users = User.all

      expect(users.length).to eq 2
      expect(users.first).to be_a User
      expect(users.first.name).to eq 'RaySmith'
      expect(users.first.email).to eq 'ray@smith.com'
      expect(users.first.username).to eq 'RayRay'
      expect(users.first.password).to eq 'ray123'
    end
  end

  describe '.find' do
    it 'returns the requested user object' do
      user = User.create(name: 'Test', email: 'test@test.com', username: 'Tessty', password: 'test123')
      user2 = User.create(name: 'Test', email: 'test@test.com', username: 'Tessty', password: 'test123')

      result = User.find(id: user.id)

      expect(result).to be_a User
      expect(result.id).to eq user.id
      expect(result.name).to eq 'Test'
      expect(result.email).to eq 'test@test.com'
      expect(result.username).to eq 'Tessty'
      expect(result.password).to eq 'test123'
    end
  end

  describe '.create' do
    it 'creates a new user when login form completed' do
      user = User.create(name: 'RaySmith', email: 'smith.raylene@gmail.com', username: 'RayRay', password: 'password123')
      expect(user.name).to eq 'RaySmith'
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password' do
      user = User.create(name: 'RaySmith', email: 'smith.raylene@gmail.com', username: 'RayRay', password: 'password123')
      authenticated_user = User.authenticate(email: 'smith.raylene@gmail.com', password: 'password123')
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns an error if given an incorrect username' do
      user = User.create(name: 'RaySmith', email: 'smith.raylene@gmail.com', username: 'RayRay', password: 'password123')
      expect(User.authenticate(email: 'wrong_email@gmail.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(name: 'RaySmith', email: 'smith.raylene@gmail.com', username: 'RayRay', password: 'password123')
      expect(User.authenticate(email: 'smith.raylene@gmail.com', password: 'wrongpassword')).to be_nil
    end
  end



end
