require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'Chitter_Manager_test')
      connection.exec("INSERT INTO peeps (peep) VALUES('A lovely day');")
      connection.exec("INSERT INTO peeps (peep) VALUES('An interesting day');")
      peeps = Peep.all
      expect(peeps).to include("A lovely day")
      expect(peeps).to include("An interesting day")
    end
  end
end
