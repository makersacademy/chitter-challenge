require 'peeps'

describe Peeps do
  describe '.all' do
    it 'should return all peeps' do
      connection = PG.connect(dbname: 'peeps_manager_test')

      connection.exec("INSERT INTO peeps (peeps) VALUES ('my first peep');")
      connection.exec("INSERT INTO peeps (peeps) VALUES ('my second peep');")

      peeps = Peeps.all

      expect(peeps).to include('my first peep')
      expect(peeps).to include('my second peep')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peeps.create(peeps: 'my first peep')
  
      expect(Peeps.all).to include 'my first peep'
    end
  end
end