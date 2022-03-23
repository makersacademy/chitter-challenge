require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_manager_test')

      peep = Peep.create(content: 'Hello World', time: '2020-01-01 01:00:01')
      Peep.create(content: 'Sunny today', time: '2021-05-06 13:30:30')
    
      peeps = Peep.all
      
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'Hello World'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(content: 'Howdy', time: '2021-05-06 13:30:30')
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.content).to eq 'Howdy'
    end
  end
end
