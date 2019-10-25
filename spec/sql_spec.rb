require 'sql'
describe '.insert_new_user' do
    it 'New user is added to the database' do
      connection = PG.connect(dbname: 'chitter')
      connection.exec("INSERT INTO users(name, email, username, password) VALUES('testingBOT', 'testing@testbot.com','test_user','testpassword1234');")
      users = SQL.all
      expect(users).to include('test_user')
    end
  end