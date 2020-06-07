require 'feed'

describe Feed do
  let(:user) { double(id: 1) }
  let(:peep) { double(id: 10) }
  describe ".add" do
    it 'creates a new feed entry and returns the entry instance' do
      feed = Feed.add(user, peep)
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM feed WHERE id = #{feed.id};")

      expect(feed.id).to eq persisted_data[0]['id']
      expect(feed.user).to eq user
      expect(feed.peep).to eq peep
    end
  end

  describe ".all" do
    let(:user_2) { double(id: 2) }
    let(:peep_2) { double(id: 11) }
    it 'returns a list of feed entries' do
      Feed.add(user, peep)
      Feed.add(user_2, peep_2)

      allow(User).to receive(:find).with('1').and_return(user)
      allow(User).to receive(:find).with('2').and_return(user_2)
      allow(Peep).to receive(:find).with('10').and_return(peep)
      allow(Peep).to receive(:find).with('11').and_return(peep_2)

      expect(described_class.all.first.user).to eq user_2
      expect(described_class.all.first.peep).to eq peep_2
    end
  end
end
