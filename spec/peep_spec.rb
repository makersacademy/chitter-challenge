require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.all

      expect(peep).to include("Peep test 1")
      expect(peep).to include("Peep test 2")
      expect(peep).to include("Peep test 3")
    end
  end
end 