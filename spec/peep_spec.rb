require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      # test data
      connection.exec("INSERT INTO peeps (peep) VALUES('first peep');")
      connection.exec("INSERT INTO peeps (peep) VALUES('second peep');")
      connection.exec("INSERT INTO peeps (peep) VALUES('third peep');")

      peeps = Peep.all

      expect(peeps).to include("first peep")
      expect(peeps).to include("second peep")
      expect(peeps).to include("third peep")
    end
  end
end
