require './lib/users'

describe Users do

  describe '.all' do
    it 'returns all users from database' do
      connection = PG.connect(dbname: 'chitter_manager_test')
      connection.exec("INSERT INTO users (name) VALUES('Jon');")
      users = Users.all
      expect(users).to include('Jon')
    end
  end

end
