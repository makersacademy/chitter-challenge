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

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.add('testy_boi', 'test@example.com', 'password123')
      authenticated_user = User.authenticate('test@example.com', 'password123')
  
      expect(authenticated_user.username).to eq user.username
    end

    it 'returns nil given an incorrect email address' do
      user = User.add('testy_boi', 'test@example.com', 'password123')
  
      expect(User.authenticate('nottherightemail@me.com', 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.add('testy_boi', 'test@example.com', 'password123')
  
      expect(User.authenticate('test@example.com', 'wrongpassword')).to be_nil
    end
  end
end

