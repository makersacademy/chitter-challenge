require 'peep'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO chitter (peep) VALUES ('test peep 1');")
      connection.exec("INSERT INTO chitter (peep) VALUES ('test peep 2');")
      connection.exec("INSERT INTO chitter (peep) VALUES ('test peep 3');")
      
      peeps = Peeps.all

      expect(peeps).to include("test peep 1")
      expect(peeps).to include("test peep 2")
      expect(peeps).to include("test peep 3")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peeps.create(peep: 'test peep 4')

      expect(Peeps.all).to include  'test peep 4'
    end
  end
end
