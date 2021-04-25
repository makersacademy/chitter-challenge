require 'user'
require 'pg'

describe User do
  
  describe '#create user method' do
    it 'creats a new user' do
      user = User.create(name: 'Test Name', username: 'test1', email: 'test@test.com', password: 'password123')
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("SELECT * FROM people;")

      expect(user).to be_a User
      expect(user.email).to eq 'test@test.com'
      expect(user.username).to eq 'test1'
      expect(user.name).to eq 'Test Name'
    end
  end

end
