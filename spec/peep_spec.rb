require 'peep'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep) VALUES ('What a beautil day!');")
      connection.exec("INSERT INTO peeps (peep) VALUES('Going for a run now');")

      peeps = Peep.all

      expect(peeps).to include 'What a beautil day!'
      expect(peeps).to include 'Going for a run now'
    end
  end
end