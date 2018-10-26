require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO chitter (peeps) VALUES('Knock knock');")

      peeps = Peep.all
      expect(peeps).to include('Knock knock')
    end
  end
end
