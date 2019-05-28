require 'peep'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'peep_data_test')

      connection.exec("INSERT INTO peeps (text) VALUES ('my first peep');")
      connection.exec("INSERT INTO peeps (text) VALUES ('my second peep');")
      connection.exec("INSERT INTO peeps (text) VALUES ('my third peep');")

      peep = Peep.all

      expect(peep).to include("my first peep")
      expect(peep).to include("my second peep")
      expect(peep).to include("my third peep")
    end
  end
end
