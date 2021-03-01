require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

  # Add the test data
  connection.exec("INSERT INTO peeps (peep) VALUES ('Yo');")
  connection.exec("INSERT INTO peeps (peep) VALUES('I just ate');")
  connection.exec("INSERT INTO peeps (peep) VALUES('Goodnight everyone');")
      peeps = Peep.all

      expect(peeps).to include("Yo")
      expect(peeps).to include("I just ate")
      expect(peeps).to include("Goodnight everyone")
    end
  end
end
