require 'messages'

describe Messages do 
  context '.get_all' do 
    connection = PG.connect(dbname: 'chitter_test')
    it 'returns all messages' do 
      # test data set up 
      connection.exec("INSERT INTO peeps (message, name) VALUES('hi', 'Gina');")
      connection.exec("INSERT INTO peeps (message, name) VALUES('databases are fun', 'Guy');")
      messages = Messages.get_all
      expect(messages).to include('hi')
      expect(messages).to include('databases are fun')
      #expect(messages).to include('Gina')
      #expect(messages).to include('Guy')
    end 
  end 
  context '.create' do 
    it 'creates a new message' do 
      Messages.create(message: "testing .create")
      expect(Messages.get_all).to include "testing .create"
    end 
  end 

end 