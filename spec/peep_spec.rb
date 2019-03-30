require 'pg'
require 'peep'

describe Peep do
  describe '.create' do
    it 'Creates a new peep' do
      connection = PG.connect(dbname: 'chitter_test')
      peep = Peep.create('This is a new peep')
      result = connection.exec('SELECT * FROM peeps')

      expect(peep).to be_a Peep
      expect(peep.id).to eq result[0]['id']
      expect(peep.content).to eq 'This is a new peep'
    end
  end
end
