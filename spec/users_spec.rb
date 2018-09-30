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
    it 'returns false when user already exists' do
      Users.create('donald@whitehouse.gov','iloveputin')
      expect(Users.create('donald@whitehouse.gov', 'ieatcheeseburgersinbed')).to eq false
    end
  end
  describe 'exists?' do
    it 'returns true if user already exists' do
      Users.create('donald@whitehouse.gov','iloveputin')
      expect(Users.exists?('donald@whitehouse.gov')).to eq true
    end
  end
end
