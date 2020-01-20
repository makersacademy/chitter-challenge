require 'peep'

describe Peep do

  describe '.all' do
    it 'returns a list of peeps from the database' do
      connection = PG.connect(dbname: 'chitter_manager')
      connection.exec("INSERT INTO peeps VALUES(1, 'My first peep');")

      peeps = Peep.all

      expect(peeps).to include 'My first peep'
    end
  end
end
