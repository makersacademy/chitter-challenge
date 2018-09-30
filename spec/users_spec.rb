require 'users'

describe Users do
  describe '#create' do
    it 'adds a new user to the database' do
      Users.create('donald@whitehouse.gov','iloveputin')
      users = DatabaseConnection.exec("SELECT * FROM users")
      expect(users[1]['email']).to eq 'donald@whitehouse.gov'
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
  describe 'authenticate' do
    it 'returns user when login successful' do
      user = Users.authenticate('test@email.com','password')
      expect(user.email).to eq 'test@email.com'
    end
    it 'Tells when password is wrong' do
      user = Users.authenticate('test@email.com','wrong password')
      expect(user).to eq "Wrong password"
    end
    it 'Tells when user does not exist' do
      user = Users.authenticate('not_existent@email.com','password')
      expect(user).to eq "User does not exist"
    end
  end
end
