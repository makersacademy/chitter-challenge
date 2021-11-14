require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES('This is my peep');")
      connection.exec("INSERT INTO peeps (message) VALUES('Another peep');")
      connection.exec("INSERT INTO peeps (message) VALUES('Third peep');")
      
      peeps = Peep.all

      expect(peeps).to include('This is my peep')
      expect(peeps).to include('Another peep')
      expect(peeps).to include('Third peep')
    end
  end
end
