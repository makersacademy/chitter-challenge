require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of all peeps' do
     peeps = Peep.all

      expect(peeps).to include("I'm happy today")
      expect(peeps).to include("I'm sad today")
      expect(peeps).to include("I'm feeling fun")
    end
  end
end