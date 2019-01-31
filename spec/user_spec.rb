require 'user'

describe User do

  describe '#all_users' do
    it 'Returns all users from the database' do
      users = User.all_users
      expect(users[0].email).to eq "testemail@gmail.com"
      expect(users[0].password).to eq "password"
    end
  end

  describe '#add_user' do
    it 'Adds a user to a database' do
      User.add("test2.gmail.com", "password2")
      users = User.all_users
      expect(users[1].email).to eq "test2.gmail.com"
      expect(users[1].password).to eq "password2"
    end
  end

end
