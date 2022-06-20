require 'user'

RSpec.describe User do

  describe '.create' do
    xit 'creates a new user' do
      # connection = PG.connect(dbname: 'chitter_chatter_test')
      # connection.exec("INSERT INTO users (username, email) VALUES ('Godzilla', 'godzilla@email.com');")
  
      user = User.create('Godzilla')

      expect(user).to include('Godzilla')
    end

    it 'creates a new user with email and password' do
      # connection = PG.connect(dbname: 'chitter_chatter_test')
      # connection.exec("INSERT INTO users (username, email) VALUES ('Godzilla', 'godzilla@email.com');")
  
      user = User.create('Godzilla', 'godzilla@email.com', '1234')

      expect(user).to include('Godzilla')
      expect(user).to include('godzilla@email.com')
      expect(user).to include('1234')
    end
  end
end

#TESTING git push