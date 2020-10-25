require 'pg'

describe Peep do
  describe '.list' do
    it 'lists all peeps in database' do
      DatabaseConnection.query("INSERT INTO peeps VALUES (1, 'my first peep');")
      DatabaseConnection.query("INSERT INTO peeps VALUES (2, 'my second peep');")
      DatabaseConnection.query("INSERT INTO peeps VALUES (3, 'my third peep');")

      peeps = Peep.list

      expect(peeps).to include('my first peep')
      expect(peeps).to include('my second peep')
      expect(peeps).to include('my third peep')
    end
  end
  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'i created a peep')
      expect(Peep.list).to include 'i created a peep'
    end
  end
end
