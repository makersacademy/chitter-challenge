require './lib/chitter'

describe Chitter do
  describe '#add_peep' do
    it'Adds new peeps' do
      peeps = Chitter.add_peep(peep: 'My first Peep')
      
      expect(peeps).to include "My first Peep"
    end
  end
end