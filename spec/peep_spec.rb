require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all bookmarks' do
      peep = Peep.view_all

      expect(peep).to include("This is a peep")
      expect(peep).to include("This is another peep")
      expect(peep).to include("This is a third peep")
    end
  end
end
