require './lib/peeps'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_manager_test')

      connection.exec("INSERT INTO peeps (content) VALUES ('peep 6/1');")
      connection.exec("INSERT INTO peeps (content) VALUES ('peep 5/1');")
      connection.exec("INSERT INTO peeps (content) VALUES ('peep 4/1');")
      connection.exec("INSERT INTO peeps (content) VALUES ('peep 3/1');")
      connection.exec("INSERT INTO peeps (content) VALUES ('peep 2/1');")
      connection.exec("INSERT INTO peeps (content) VALUES ('peep 1/1');")

      peeps = Peep.all

      expect(peeps).to include 'peep 6/1'
      expect(peeps).to include 'peep 5/1'
      expect(peeps).to include 'peep 4/1'
      expect(peeps).to include 'peep 3/1'
      expect(peeps).to include 'peep 2/1'
      expect(peeps).to include 'peep 1/1'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(content: 'Love to Peep!')

      expect(Peep.all).to include 'Love to Peep!'
    end
  end
end
