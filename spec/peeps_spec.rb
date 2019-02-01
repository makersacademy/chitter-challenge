require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep) VALUES ('First peep');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('Second peep');")

      peeps = Peeps.all

      expect(peeps).to include("First peep")
      expect(peeps).to include("Second peep")
    end
  end
end
