require 'message_manager'

describe Message_manager do
  describe '.post_peep' do
    it 'saves a peep in a messages table in the database' do
      peep = Message_manager.post_peep(content: 'My new peep')
      # persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Message
      # expect(peep.id).to eq persisted_data[:id]
      expect(peep.content).to eq 'My new peep'
    end
  end

  describe '.show_peeps' do
    it 'returns a list of peeps' do
      time_now = Time.parse("2018-11-22 12:00:00")
      allow(Time).to receive(:now) { time_now }

      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      peep = Message_manager.post_peep(content: "My first peep")
      Message_manager.post_peep(content: "My second peep")
      Message_manager.post_peep(content: "My third peep")

      chitter_feed = Message_manager.show_peeps

      expect(chitter_feed.length).to eq 3
      expect(chitter_feed.first).to be_a Message
      expect(chitter_feed.first.id).to eq peep.id
      expect(chitter_feed.first.content).to eq 'My first peep'
      expect(chitter_feed.first.timestamp).to eq("2018-11-22 12:00:00")
    end
  end
end
