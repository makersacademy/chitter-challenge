require 'user.rb'

describe User do

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO users (name, email, username, password) VALUES ('RaySmith', 'ray@smith.com', 'RayRay', 'ray123');")
      connection.exec("INSERT INTO users (name, email, username, password) VALUES ('SteveSmith', 'steve@smith.com', 'Stevo', 'steve123');")

      users = User.all

      expect(users.length).to eq 2
      expect(users.first).to be_a User
      expect(users.first.name).to eq 'RaySmith'
      expect(users.first.email).to eq 'ray@smith.com'
      expect(users.first.username).to eq 'RayRay'
      expect(users.first.password).to eq 'ray123'
    end
  end

  # describe '.create' do
  #   it 'creates a new user when login form completed' do
  #     user = User.create(name: 'RaySmith', email: 'smith.raylene@gmail.com', username: 'RayRay', password: 'password123')
  #     expect(user.name).to eq 'RaySmith'
  #   end
  # end

end
