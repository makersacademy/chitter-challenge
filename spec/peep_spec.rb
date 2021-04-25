require 'peep'

describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      described_class.create('a message')

      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec('SELECT * FROM peep;')
      expect(result[0]['message']).to eq('a message')
    end
  end

  describe '.list' do
    it 'returns a list of 1 peep' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peep (message) VALUES ('a great peep');")

      expect(described_class.list[0].message).to eq('a great peep')
    end
  end
end
