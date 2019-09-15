require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data:
      connection.exec("INSERT INTO peeps (peep) VALUES('Hello world! First peep!')")
      connection.exec("INSERT INTO peeps (peep) VALUES('My second peep!')")
      connection.exec("INSERT INTO peeps (peep) VALUES('Third time lucky!')")

      peeps = Peep.all
      expect(peeps).to include('Hello world! First peep!')
      expect(peeps).to include('My second peep!')
      expect(peeps).to include('Third time lucky!')
    end
  end
end
