require 'user'
require_relative '../lib/database_connection'

describe User do
  describe '#create' do
    it 'creates a user' do
      user = User.create("Joe", "Bloggs", "peeper1234", "p4s5w0rd", "test@test.com")
      # sql = %{select * from users where username = 'peeper1234'}
      # users = DatabaseConnection.query(sql)
        # p users[0]
      expect(user).to be_a User
      expect(user.password).to eq "p4s5w0rd"
    end
  end

  describe '#find' do
    it 'find a user by id' do
      user = User.create("Joe", "Bloggs", "peeper1234", "p4s5w0rd", "test@test.com")
      result = User.find(user.id)
        # p users[0]
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end

end
