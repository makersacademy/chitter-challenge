require 'input_checkers'
require 'pg'

describe InputCheckers do

  before(:each) do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO users (name, user_name, email, password) VALUES('test name', 'test user name', 'test@email.com', 'testpassword');")
  end


  describe '#unique_input_checker' do
    it 'returns true if an email argument matches an email in database' do
      expect(InputCheckers.unique_input_checker("test@email.com", :email)).to eq true
    end

    it 'returns true if an user name argument matches a user name in database' do
      expect(InputCheckers.unique_input_checker("test user name", :user_name)).to eq true
    end
  end

  describe '#log_in_checker' do
    it 'returns true if log in elements match database elements for user' do
      expect(InputCheckers.log_in_checker('test user name', 'testpassword')).to eq true
    end

    it 'returns false if log in elements do not match database elements for user' do
      expect(InputCheckers.log_in_checker('incorrect user name', 'incorrect password')).to eq false
    end
  end
end
