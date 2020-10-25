require_relative '../../lib/chitter.rb'
require 'pg'
describe ChitterManager do
  describe '.all' do
    it 'returns all the peeps' do
      #set up to add peep to db
      connection = PG.connect(dbname: 'chitter_manager_test')
      connection.exec("INSERT INTO peeps (peep) VALUES ('I saw twelve chickens in the park earlier');")
      connection.exec("INSERT INTO peeps (peep) VALUES('There are 9 million bicycles in Beijing');")
      expect(ChitterManager.all).to include('I saw twelve chickens in the park earlier')    
    end
  end
end

#create test database, database set up helper, update db/migrations
#method to clear test database each time it is run,  