require './lib/chitter'

describe Chitterpeep do
  describe '#add_peep' do
    it'Adds new peeps' do
      peeps = Chitterpeep.add_peep('My first Peep')
     
      expect(peeps).to include "My first Peep"
    end
  end
end