require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (peep_text) VALUES ('This is a peep');")
      connection.exec("INSERT INTO peeps (peep_text) VALUES ('Peep peep!');")
      connection.exec("INSERT INTO peeps (peep_text) VALUES ('peeping away 🐥');")
      
      peeps = Peep.all

      expect(peeps).to include("This is a peep")
      expect(peeps).to include("Peep peep!")
      expect(peeps).to include("peeping away 🐥")
    end
  end
end
