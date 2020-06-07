require 'feed'

describe Feed do
  describe ".add" do
    let(:user) { double(id: 1) }
    let(:peep) { double(id: 10) }
    it 'creates a new feed entry and returns the entry instance' do
      feed = Feed.add(user, peep)
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM feed WHERE id = #{feed.id};")

      expect(feed.id).to eq persisted_data[0]['id']
      expect(feed.user).to eq user
      expect(feed.peep).to eq peep
    end
  end
end