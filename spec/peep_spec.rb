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

  describe '.all' do
    it 'Returns all peeps in reverse order' do
      connection = PG.connect(dbname: 'chitter_test')
      Peep.create('First peep')
      Peep.create('Second peep')
      peep = Peep.create('Third peep')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq "Third peep"
    end
  end
end
