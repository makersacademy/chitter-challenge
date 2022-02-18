require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (message) VALUES ('Test peep 1');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Test peep 2');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Test peep 3');")

      peep = Peep.all

      expect(peep).to include("Test peep 1")
      expect(peep).to include("Test peep 2")
      expect(peep).to include("Test peep 3")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'Test peep 5')
  
      expect(Peep.all).to include 'Test peep 5'
    end
  end
end