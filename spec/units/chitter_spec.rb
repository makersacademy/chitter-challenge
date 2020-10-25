require_relative '../../lib/chitter.rb'
require 'pg'
describe Peep do
  describe '.all' do
    it 'returns all the peeps' do
      connection = PG.connect(dbname: 'chitter_manager_test')
      connection.exec("INSERT INTO peeps (peep) VALUES ('I saw twelve chickens in the park earlier');")
      connection.exec("INSERT INTO peeps (peep) VALUES('There are 9 million bicycles in Beijing');")
      expect(Peep.all).to include('I saw twelve chickens in the park earlier')    
    end
  end
end

