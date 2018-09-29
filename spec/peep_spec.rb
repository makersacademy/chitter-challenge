require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all tweets in reverse order' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps VALUES(1, 'My third peep');")
      connection.exec("INSERT INTO peeps VALUES(2, 'My second peep');")
      connection.exec("INSERT INTO peeps VALUES(3, 'My first peep');")

      peeps = Peep.all

      expect(peeps.first).to include "My third peep"
      expect(peeps.last).to include "My first peep"
    end
  end
end
