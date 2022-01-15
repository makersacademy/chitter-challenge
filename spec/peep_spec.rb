require './lib/peep'
require './spec/database_helpers'

describe Peep do
  
  describe '.create' do
    it 'creates a Peep' do
      peep = Peep.add(content: 'My first peep!')
      persisted_data = persisted_data(peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data[0]['id']
      expect(peep.content).to eq 'My first peep!'
    end
  end
end
