require 'chitter'

describe Chitter do
  subject(:chitter) { described_class } 

  describe '.all' do
    it 'returns a list of all bookmarks' do

      Chitter.create(message: 'hello, welcome to Chitter!')
      Chitter.create(message: 'photo of my lovely piece of broccoli')
      chitter = Chitter.create(message: 'selfie photo of me')

      chitter_feed = Chitter.all

      expect(chitter_feed.length).to eq 3
      expect(chitter_feed.first).to be_a Chitter
      expect(chitter_feed.first.id).to eq chitter.id
      expect(chitter_feed.first.peep).to eq 'selfie photo of me'
    end
  end

  describe '.create' do
    it 'adds a new url to bookmarks list' do
      chitters = Chitter.create(message: 'hello, welcome to Chitter!')

      expect(chitters).to be_a Chitter
      # expect(bookmark.id).to eq persisted_data['id']
      expect(chitters.peep).to eq 'hello, welcome to Chitter!'
    end
  end

#   describe '.delete' do
#     it 'deletes a url to bookmarks list' do
#       bookmark = Bookmark.create(url: 'https://www.bbc.co.uk', title: 'BBC')

#       Bookmark.delete(id: bookmark.id)

#       expect(Bookmark.all.length).to eq 0
#     end
#   end
end
