require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (text) VALUES ('Posting peeps is so much fun!');")
      connection.exec("INSERT INTO peeps (text) VALUES ('Loving this new database stuff');")

      peeps = Peep.all

      expect(peeps).to include('Posting peeps is so much fun!')
      expect(peeps).to include('Loving this new database stuff')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(text: 'Posting peeps is so much fun!')

      expect(Peep.all).to include 'Posting peeps is so much fun!'
    end
  end
end