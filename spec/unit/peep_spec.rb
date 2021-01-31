require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (peep) VALUES ('I love this new app Chitter');")

      peeps = Peep.all
      expect(peeps).to include("I love this new app Chitter")
    end
  end
end
