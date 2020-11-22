require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include "Peep 1!"
      expect(peeps).to include "Peep 2!"
    end
  end

end
