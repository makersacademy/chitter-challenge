require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all tweets in reverse order' do
      peeps = Peep.all

      expect(peeps).to include "My third peep"
      expect(peeps).to include "My second peep"
      expect(peeps).to include "My first peep"
    end
  end
end
