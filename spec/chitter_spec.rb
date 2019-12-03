require './lib/chitter'

describe Chitter do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (peep) VALUES('It is sunny!'),
      ('My head hurts.'),
      ('Not bad for a Monday');")

      peeps = Chitter.all

      expect(peeps).to include 'It is sunny!'
      expect(peeps).to include 'My head hurts.'
      expect(peeps).to include 'Not bad for a Monday'
    end
  end
  describe '.create' do
    it 'creates a new peep' do
      Chitter.create(peep: 'I am here')

      expect(Chitter.all).to include 'I am here'
    end
  end
end
