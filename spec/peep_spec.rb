require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      bookmarks = Peep.all

      expect(bookmarks).to include("Peep 1")
      expect(bookmarks).to include("Peep 2")
      expect(bookmarks).to include("Peep 3")
    end
  end
end
