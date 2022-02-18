require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.all

      expect(peep).to include("Test peep 1")
      expect(peep).to include("Test peep 2")
      expect(peep).to include("Test peep 3")
    end
  end
end