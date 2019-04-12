require 'peer'

describe Peer do
  describe ".all" do
    it "return a lsit with all peers back" do
      peers = Peer.all

      expect(peers.length).to eq 1
      expect(peers.first).to be_a Peer
      expect(peers.first.id).to eq "1"
      expect(peers.first.content).to eq "First test peer"
    end
  end

  describe '.create' do
    it 'creates a new peer' do
      peer = Peer.create(user_id: 1, content: 'Create test')
      # persisted_data = persisted_data(id: bookmark.id, table: 'bookmarks')

      expect(peer).to be_a Peer
      expect(peer.user_id).to eq "1"
      expect(peer.content).to eq 'Create test'
    end
  end
end
