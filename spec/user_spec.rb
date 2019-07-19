require './models/user'

describe User do

  describe '#.all' do
    it 'returns all user details apart from password' do
    
    connection = PG.connect(dbname: 'peep_manager_test')
    connection.exec("INSERT INTO users (username, name, email) VALUES('richieganney', 'richie', 'richieganney@gmail.com');")
    users = User.all
    expect(users.flatten).to include 'richieganney'
    expect(users.flatten).to include 'richieganney@gmail.com'
    end
  end

  describe '#.add' do
    it 'adds user information to the database' do
      expect(User.add('username', 'email', 'password')).to be_a User
    end
  end
end

