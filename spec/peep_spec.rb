require './models/peep.rb'

describe Peep do
  describe '#all_peeps' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_app_test')
      
      # Add the test data
      connection.exec("INSERT INTO peep_messages (message) VALUES ('Peep 1 by Pusheen');")
      connection.exec("INSERT INTO peep_messages (message) VALUES('Peep 2 by Gudetama');")
      connection.exec("INSERT INTO peep_messages (message) VALUES('Peep 3 by Yoda');")

      peeps = Peep.all_peeps

      expect(peeps).to include("Peep 1 by Pusheen")
      expect(peeps).to include("Peep 2 by Gudetama")
      expect(peeps).to include("Peep 3 by Yoda")
    end
  end
end