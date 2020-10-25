require 'pg'

describe Peep do
  describe '.list' do
    it 'lists all peeps in database' do
      DatabaseConnection.query("INSERT INTO peeps VALUES (1, 'my first peep');")
      DatabaseConnection.query("INSERT INTO peeps VALUES (2, 'my second peep');")
      DatabaseConnection.query("INSERT INTO peeps VALUES (3, 'my third peep');")

      peeps = Peep.list

      expect(peeps[0][:message]).to include('my first peep')
      expect(peeps[1][:message]).to include('my second peep')
      expect(peeps[2][:message]).to include('my third peep')
    end
  end
end
