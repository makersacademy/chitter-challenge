require './models/peep.rb'

describe Peep do
  describe '#all_peeps' do
    it 'returns all peeps' do
      peeps = Peep.all_peeps

      expect(peeps).to include("Peep 1 by Pusheen")
      expect(peeps).to include("Peep 2 by Gudetama")
      expect(peeps).to include("Peep 3 by Yoda")
    end
  end
end