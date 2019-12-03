require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("This is message 3")
      expect(peeps).to include("Here is message 2")
      expect(peeps).to include("hello message 1")
    end
  end
end
