require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps VALUES(1, 'My first peep');")
      connection.exec("INSERT INTO peeps VALUES(2, 'Hello');")

      peeps = Peep.all
      expect(peeps).to include('My first peep')
      expect(peeps).to include('Hello')
    end
  end
end
