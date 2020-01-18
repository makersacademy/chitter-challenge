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
end
