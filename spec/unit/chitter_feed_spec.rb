require 'chitter_feed'

describe ChitterFeed do
  describe '#all' do
    it 'returns all previous peeps' do
      connection = PG.connect(dbname: 'chitter_app_test')

      connection.exec("INSERT INTO chitter (peep) VALUES('First Peep!');")
      connection.exec("INSERT INTO chitter (peep) VALUES('Second Peep!');")
      connection.exec("INSERT INTO chitter (peep) VALUES('Third Peep!');")
      
      feed = ChitterFeed.all

      expect(feed).to include("First Peep!")
      expect(feed).to include("Second Peep!")
      expect(feed).to include("Third Peep!")
    end
  end
  
  describe '#add' do
    it 'adds a new peep' do
      ChitterFeed.add(peep: 'Here is a peep example')
  
      expect(ChitterFeed.all).to include 'Here is a peep example'
    end
  end
end
