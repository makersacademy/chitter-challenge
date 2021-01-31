require './lib/users'

describe Users do

  describe '.all' do
    it 'returns all users from database' do
      #connect
      connection = PG.connect(dbname: 'user_manager_test')
      
      #inject
      connection.exec("INSERT INTO users (name) VALUES('Unit Test 1');")

      #confirm
      users = Users.all
      expect(users).to include('Unit Test 1')
    end
  end

end
