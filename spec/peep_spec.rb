require 'peep.rb'

describe Peep do
  describe '.all' do
    it 'returns the list of peeps' do
      connection = PG.connect :dbname => 'chitter_test'

      connection.exec("INSERT INTO peeps (message, user_id) VALUES ('Hello!', 'Makers');")
      connection.exec("INSERT INTO peeps (message, user_id) VALUES ('Groot?', 'Groot');")
      connection.exec("INSERT INTO peeps (message, user_id) VALUES ('Donut...', 'Homer');")

      peeps = Peep.all
      expect(peeps).to include("Hello!")
      expect(peeps).to include("Groot?")
      expect(peeps).to include("Donut...")
    end
  end

  describe '.add_peep' do
    it 'adds a new peep' do
      connection = PG.connect :dbname => 'chitter_test'

      Peep.add_peep('Hello!', 'Makers')
      peeps = Peep.all
      expect(peeps).to include("Makers")
    end
  end
end
