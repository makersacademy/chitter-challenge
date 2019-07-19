require './models/user'

describe User do

  describe '#.all' do
    it 'returns all user details apart from password' do
    
    connection = PG.connect(dbname: 'peep_manager_test')
    connection.exec("INSERT INTO users (username, email) VALUES('richieganney', 'richieganney@gmail.com');")
    users = User.all
    expect(users.flatten).to include 'richieganney'
    expect(users.flatten).to include 'richieganney@gmail.com'
    end
  end

  describe '#.add' do
    it 'adds user information to the database' do
      expect(User.add('username', 'email', 'password')).to be_a User
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
  
      User.add('testy_boi', 'test@example.com', 'password123')
    end
  end

  describe '.find' do

    it 'finds a user by username' do
      user = User.add('testy_boi', 'test@example.com', 'password123')
      result = User.find(user)
  
      expect(result.username).to eq user.username
      expect(result.email).to eq user.email
    end    

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
end

