require 'peeps'

describe Peeps do
  describe '#.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'peeps_test')

      connection.exec("INSERT INTO peeps (peep) VALUES('Watching TV');")
      connection.exec("INSERT INTO peeps (peep) VALUES('Getting a haircut');")

      peeps = Peeps.all

      expect(peeps).to include("Watching TV")
      expect(peeps).to include("Getting a haircut")
    end
  end
end
