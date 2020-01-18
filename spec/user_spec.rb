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
  end
end
