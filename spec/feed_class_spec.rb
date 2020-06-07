require 'feed'

describe Feed do
  describe ".add" do
    it 'creates a new feed entry and returns the entry instance' do
      user_2 = User.create('test2', 'test2@email.com', 'test2password', 'test two')
      peep_2 = Peep.create('Peep for user_2')

      feed = Feed.add(user_2, peep_2)
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM feed WHERE id = #{feed.id};")

      expect(feed.id).to eq persisted_data[0]['id']
      expect(feed.user).to eq user_2
      expect(feed.peep).to eq peep_2
    end
  end

  describe ".all" do
    it 'returns a list of feed entries' do
      user_2 = User.create('test2', 'test2@email.com', 'test2password', 'test two')
      user_3 = User.create('test3', 'test3@email.com', 'test3password', 'test three')
      peep_2 = Peep.create('Peep for user_2')
      peep_3 = Peep.create('Peep for user_3')
      
      Feed.add(user_2, peep_2)
      Feed.add(user_3, peep_3)

      expect(described_class.all.first.user.id).to eq user_3.id
      expect(described_class.all.first.peep.id).to eq peep_3.id
    end
  end
end
