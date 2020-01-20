require 'User'

describe User do
  describe '.create' do
    it 'create a user in the database and return an instance of User' do
      user = User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
      database_user = PG.connect(dbname: 'chitter_test').exec("SELECT id FROM users WHERE id='#{user.id}';")
      
      expect(user.name).to eq 'Umberto'
      expect(user.username).to eq 'uValente'
      expect(user.email).to eq 'mock@gmail.com'
      expect(user.id).to eq database_user[0]['id']
    end

    it 'encrypt the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('psw123')
      User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
    end
  end

  describe '.find' do
    it 'find a user from his id' do
      user = User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
      database_user = PG.connect(dbname: 'chitter_test').exec("SELECT id, name, username, email FROM users WHERE id='#{user.id}';")

      expect(User.find(id: user.id).id).to eq database_user[0]['id']
      expect(User.find(id: user.id).name).to eq database_user[0]['name']
      expect(User.find(id: user.id).username).to eq database_user[0]['username']
      expect(User.find(id: user.id).email).to eq database_user[0]['email']
    end

    it "return nil if there is no id" do
      expect(User.find(id: nil)).to be_nil
    end
  end

  describe '.authenticate' do
    it 'return a user if logging in with the right credentials' do
      user = User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
      authenticated_user = User.authenticate(email: 'mock@gmail.com', password: 'psw123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'return nil if logging in with the wrong email' do
      User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
      authenticated_user = User.authenticate(email: 'wrong@gmail.com', password: 'psw123')

      expect(authenticated_user).to be_nil
    end

    it 'return nil if logging in with the wrong password' do
      User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
      authenticated_user = User.authenticate(email: 'mock@gmail.com', password: 'wrong123')

      expect(authenticated_user).to be_nil
    end
  end

  describe '.used_data?' do
    it 'return false if email and username are not already in use' do
      User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
      result = User.used_data?(username: 'aNon', email: 'another@mail.com')
      expect(result).to be false
    end

    it 'return true if email is already in use' do
      User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
      result = User.used_data?(username: 'aNon', email: 'mock@gmail.com')
      expect(result).to be true
    end

    it 'return true if username is already in use' do
      User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
      result = User.used_data?(username: 'uValente', email: 'another@gmail.com')
      expect(result).to be true
    end

    it 'return true if username and email are already in use' do
      User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
      result = User.used_data?(username: 'uValente', email: 'mock@gmail.com')
      expect(result).to be true
    end
  end
end
