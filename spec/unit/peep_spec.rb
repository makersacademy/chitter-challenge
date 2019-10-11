require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all the peeps' do
      connection = PG.connect(dbname: 'peep_manager_test')

      connection.exec("INSERT INTO peeps (peep) VALUES ('This is a test peep');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('This is a test peep 2');") 

      peeps = Peep.all

      expect(peeps).to include("This is a test peep")
      expect(peeps).to include("This is a test peep 2")
    end
  end
end
