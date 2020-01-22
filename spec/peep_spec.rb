require 'peep'

describe Peep do

  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (peeps) VALUES ('First peep');")
      connection.exec("INSERT INTO peeps (peeps) VALUES ('Second peep');")
      connection.exec("INSERT INTO peeps (peeps) VALUES ('Third peep');")

      peeps = Peep.all

      expect(peeps).to include('First peep')
      expect(peeps).to include('Second peep')
      expect(peeps).to include('Third peep')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(peeps: 'Test peep')

      expect(Peep.all).to include 'Test peep'
    end
  end
end
