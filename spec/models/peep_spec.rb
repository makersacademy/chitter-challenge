describe Peep do
  describe '.all' do
    it 'returns all peeps in reverse order' do

      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps_data (peep) VALUES ('first peep')")
      connection.exec("INSERT INTO peeps_data (peep) VALUES ('second peep')")
      connection.exec("INSERT INTO peeps_data (peep) VALUES ('third peep')")

      peeps = Peep.all

      expect(peeps).to include("first peep")
      expect(peeps).to include("second peep")
      expect(peeps).to include("third peep")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create('new peep')
      expect(Peep.all).to include 'new peep'
    end
  end
end