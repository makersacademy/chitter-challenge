require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_manager_test')

      peep = Peep.create(content: 'Hello World', time: '2006-01-01 01:00:01')
      Peep.create(content: 'Sunny today', time: '2007-05-06 13:30:30')
    
      peeps = Peep.all
      
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'Hello World'
      expect(peeps.first.time).to eq '01/01/2006  1:00'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(content: 'Howdy', time: '2007-05-06 13:30:30')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.content).to eq 'Howdy'
      expect(peep.time).to eq '06/05/2007 13:30'
    end
  end
end
