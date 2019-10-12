require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include("It's my first peep!")
      expect(peeps).to include("Peep, peep, peep!")
    end
  end
end