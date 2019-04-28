require 'peep.rb'

describe Peep do
  describe '.all' do
    it 'returns the list of peeps' do
      connection = PG.connect :dbname => 'chitter_test'

      connection.exec("INSERT INTO peeps (message, user_id) VALUES ('Groot?', 'Groot');")
      connection.exec("INSERT INTO peeps (message, user_id) VALUES ('Donut...', 'Homer');")

      peeps = Peep.all
      expect(peeps.first.message).to eq("Groot?")
      expect(peeps.first.user_id).to include("Groot")
    end
  end

  describe '.add_peep' do
    it 'adds a new peep' do
      peeps = Peep.add_peep('Hello!', 'Makers')

      expect(peeps.message).to eq("Hello!")
      expect(peeps.user_id).to eq("Makers")
    end
  end
end
