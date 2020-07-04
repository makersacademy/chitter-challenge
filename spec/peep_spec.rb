require './lib/peep'

describe Peep do

  describe '#all' do
    it 'returns a list of all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep) VALUES ('First Peep');")
      connection.exec("INSERT INTO peeps (peep) VALUES('Second Peep');")
      
      peeps = Peep.all

      expect(peeps).to include("First Peep")
      expect(peeps).to include("Second Peep")
    end
  end
end
