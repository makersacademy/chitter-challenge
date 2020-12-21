require 'pg'

describe Peep do
  describe '.list' do
    it 'lists all peeps in database' do
      DatabaseConnection.query("INSERT INTO peeps VALUES (1, 'my first peep', '15:00');")
      DatabaseConnection.query("INSERT INTO peeps VALUES (2, 'my second peep', '16:00');")
      DatabaseConnection.query("INSERT INTO peeps VALUES (3, 'my third peep', '17:00');")

      peeps = Peep.list

      expect(peeps).to include({:message=>"my first peep", :time=>'15:00'})
      expect(peeps).to include({:message=>"my second peep", :time=>'16:00'})
      expect(peeps).to include({:message=>"my third peep", :time=>'17:00'})
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'i created a peep')
      expect(Peep.list[0][:message]).to include("i created a peep")
    end
  end
end
