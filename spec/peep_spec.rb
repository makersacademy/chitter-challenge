require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'peeps_test')

      connection.exec("INSERT INTO peeps (peep) VALUES ('This is the first peep');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('This is the second peep');")

      peeps = Peep.all


      expect(peeps).to include("This is the first peep")
      expect(peeps).to include("This is the second peep")
    end
  end
end
