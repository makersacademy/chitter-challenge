require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do

      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (peep) VALUES ('Peep test 1');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('Peep test 2');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('Peep test 3');")

      peep = Peep.all

      expect(peep).to include("Peep test 1")
      expect(peep).to include("Peep test 2")
      expect(peep).to include("Peep test 3")
    end
  end
end
