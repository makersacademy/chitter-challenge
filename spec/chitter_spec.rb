require 'peeps'
require 'database_helpers'

describe Chitter do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peeps.create(name: 'Developer Angela', peep: 'Debugging is like an onion.',tags: '#programming')
      persisted_data = persisted_data(id: peep.id)
    
      expect(peep.name).to eq 'Developer Angela'
      expect(peep.tags).to eq '#programming'

    end
  end
  
  describe '.create' do
    it 'creates a new peep' do
      peep = Peeps.create(name:'Developer Ron', peep:'90% of coding is debugging.',tags: '#programming')
      persisted_data = persisted_data(id: peep.id)

      expect(peep.name).to eq 'Developer Ron'
      expect(peep.peep).to eq '90% of coding is debugging.'
    end
  end
end
