require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do

      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (text) VALUES ('the sky is blue');")
      connection.exec("INSERT INTO peeps (text) VALUES ('the sea is green');")
      connection.exec("INSERT INTO peeps (text) VALUES ('fire is red');")

      peeps = Peep.all

      expect(peeps).to include("the sky is blue")
      expect(peeps).to include("the sea is green")
      expect(peeps).to include("fire is red")
    end
  end
end
