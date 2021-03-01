require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all bookmarks' do
      peeps = Peep.all

      expect(peeps).to include("Yo")
      expect(peeps).to include("I just ate")
      expect(peeps).to include("Goodnight everyone")
    end
  end
end
