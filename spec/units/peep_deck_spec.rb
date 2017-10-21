require 'peep_deck'

describe PeepDeck do

subject(:peep_deck) { described_class.new }
let (:posted_peeps) { double(:posted_peeps,
                              any?: true,
                              all: [{ created_at: 2 }, { created_at: 3 }, { created_at: 1 }]) }

  describe "#display" do
    it "returns an array of Peeps in reverse chronological order" do
      expect(peep_deck.display(posted_peeps)).to eq [{ created_at: 3 }, { created_at: 2 }, { created_at: 1 }]
    end
    it "returns an empty array if no Peeps have been posted" do
      allow(posted_peeps).to receive(:any?) { false }
      expect(peep_deck.display(posted_peeps)).to eq []
    end
  end
end
