require './lib/peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (body) VALUES ('My first peep');")
      connection.exec("INSERT INTO peeps (body) VALUES('Another peep');")
      connection.exec("INSERT INTO peeps (body) VALUES('Hello');")

      peeps = Peep.all

      expect(peeps).to include("My first peep")
      expect(peeps).to include("Another peep")
      expect(peeps).to include("Hello")
    end
  end
end
