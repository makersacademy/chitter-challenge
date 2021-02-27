require 'peeps'

describe Peeps do
  describe '#.all' do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps).to include("Watching TV")
      expect(peeps).to include("Getting a haircut")
    end
  end
end
