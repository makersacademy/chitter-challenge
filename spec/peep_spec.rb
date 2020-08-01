require 'peep'

describe Peep do

  describe '.all' do
    it 'returns a list of peeps' do
      peeps = Peep.all
      
      expect(peeps).to include "Test peep text"
      expect(peeps).to include "Another test peep text"
    end
  end
end
