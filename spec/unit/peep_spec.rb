require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all Peeps' do
      connection = PG.connect(dbname: 'test_chitter')

      connection.exec("INSERT INTO peeps VALUES(1, 'Finn', 'Test Peep');")
      connection.exec("INSERT INTO peeps VALUES(2, 'Finn', 'I am a test peep');")
      connection.exec("INSERT INTO peeps VALUES(3, 'Finn', 'Me too');")

      peeps = Peep.all

      expect(peeps).to include('Test Peep')
      expect(peeps).to include('I am a test peep')
      expect(peeps).to include('Me too')
    end
  end
end