require 'chitter_feed'

describe ChitterFeed do 
  
  describe '.all' do 
    it 'returns all the messages in the feed' do 
        connection = PG.connect(dbname: 'chitter_manager_test')

        connection.exec("INSERT INTO chitter (name,message) VALUES('unknown', 'Hello World');")
        connection.exec("INSERT INTO chitter (name,message) VALUES('unknown', 'Hello Chitter');")

        feed = ChitterFeed.all

        p feed

        expect(feed).to include("Hello World")
        expect(feed).to include("Hello Chitter")
    end
  end

  describe '.post' do 
    it 'creates a new peep to add ot the feed' do 
      ChitterFeed.post(peep: "Hello World")

      expect(ChitterFeed.all).to include "Hello World"
    end
  end
  

end


