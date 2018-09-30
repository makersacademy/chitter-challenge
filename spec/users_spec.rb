require 'users'

describe Users do
  describe '#create' do
    it 'adds a new user to the database' do
      Users.create('donald@whitehouse.gov','iloveputin')
      users = DatabaseConnection.exec("SELECT * FROM users")
      expect(users[0]['email']).to eq 'donald@whitehouse.gov'
    end
    it 'returns a new user' do
      user = Users.create('donald@whitehouse.gov','iloveputin')
      expect(user.email).to eq 'donald@whitehouse.gov'
    end
  end
end
