require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('hello');")
      connection.exec("INSERT INTO peeps (message) VALUES('world');")

      peeps = Peep.all

      expect(peeps).to include("hello")
      expect(peeps).to include("world")
    end
  end

end
