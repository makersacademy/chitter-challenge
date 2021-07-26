require 'peep'

RSpec.describe Peep do
  describe '.all' do
    it 'returns all the peeps' do
      connection = PG.connect(dbname: 'peep_manager_test')

      connection.exec("INSERT INTO peeps (peep) VALUES ('Hi, I am peep three');")
      connection.exec("INSERT INTO peeps (peep) VALUES('Hi, I am peep two');")
      connection.exec("INSERT INTO peeps (peep) VALUES('Hi, I am peep one');")

      peeps = Peep.all

      expect(peeps).to include('Hi, I am peep three')
      expect(peeps).to include('Hi, I am peep two')
      expect(peeps).to include('Hi, I am peep one')
    end
  end
end
