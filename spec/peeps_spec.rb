require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps).to include("First peep")
      expect(peeps).to include("Second peep")
    end
  end
end
