require 'chitter_feed'

describe ChitterFeed do
  describe '.all' do 
    it 'returns a list of peeps' do 
      connection = PG.connect(dbname: 'chitter')

      connection.exec("INSERT INTO chitter_feed (peep) VALUES ('This is my first peep on Chitter!');")
      connection.exec("INSERT INTO chitter_feed (peep) VALUES('I love Chitter');")
      connection.exec("INSERT INTO chitter_feed (peep) VALUES('I spend most of my time coding');")
      
      chitter_feed = ChitterFeed.all

        expect(chitter_feed).to include "This is my first peep on Chitter!"
        expect(chitter_feed).to include "I love Chitter"
        expect(chitter_feed).to include "I spend most of my time coding"
    end
  end
end