require 'chitter_feed'

describe ChitterFeed do
  describe '#all' do
    it 'returns all previous peeps' do
      feed = ChitterFeed.all

      expect(feed).to include "First Peep!"
      expect(feed).to include "Second Peep!"
      expect(feed).to include "Third Peep!"
    end
  end
end
