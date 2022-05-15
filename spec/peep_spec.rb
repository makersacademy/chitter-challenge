require 'peep'

describe Peep do
  describe '.all' do
    it 'shows all Peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      
      connection.exec("INSERT INTO peeps (content) VALUES ('Elon who?');")
      connection.exec("INSERT INTO peeps (content) VALUES ('COYS');")
      connection.exec("INSERT INTO peeps (content) VALUES ('123456789');")

      peeps = Peep.all

      expect(peeps).to include('Elon who?')
      expect(peeps).to include('COYS')
      expect(peeps).to include('123456789')
    end
  end

  describe '.new' do
    it 'creates a new Peep' do
      Peep.new(content: 'Test Peep')

      expect(Peep.all).to include 'Test Peep'
    end
  end
end 