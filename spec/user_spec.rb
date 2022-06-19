require 'user'

RSpec.describe User do

  describe '.create' do
    it 'creates a new user' do
      # connection = PG.connect(dbname: 'chitter_chatter_test')
      # connection.exec("INSERT INTO users (username, email) VALUES ('Godzilla', 'godzilla@email.com');")
  
      user = User.create('Godzilla')

      expect(user).to include('Godzilla')
    end
  end

end
