require 'peep'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      bookmarks = Peep.all

      expect(bookmarks).to include('Have a nice day.')
    end
  end
end