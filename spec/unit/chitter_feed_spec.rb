require 'chitter_feed'

describe ChitterFeed do 
  
  describe '.all' do 
    it 'returns all the messages in the feed' do 
      connection = PG.connect(dbname: 'chitter_manager_test')

      first_peep = ChitterFeed.post(peep: "Hello World")
      ChitterFeed.post(peep: "Hello Chitter")
      ChitterFeed.post(peep: "Is this really twitter")

      feed = ChitterFeed.all

      expect(feed.length).to eq 3
      expect(feed.first).to be_a ChitterFeed
      expect(feed.first.id).to eq first_peep.id
      expect(feed.first.message).to eq "Hello World"
       
    end
  end

  describe '.post' do 
    it 'creates a new peep to add to the feed' do 
      first_peep = ChitterFeed.post(peep: "Hello World")
      persisted_data = PG.connect(dbname: 'chitter_manager_test').query("SELECT * FROM chitter WHERE id = #{first_peep.id};")

      expect(first_peep).to be_a ChitterFeed
      expect(first_peep.id).to eq persisted_data.first['id']
      expect(first_peep.message).to eq "Hello World"
    end

    it 'should recognise username as an argument' do 
      first_peep = ChitterFeed.post(peep: "Where is Chi Chi", username: "Goku")
      persisted_data = PG.connect(dbname: 'chitter_manager_test').query("SELECT * FROM chitter WHERE id = #{first_peep.id};")

      expect(first_peep).to be_a ChitterFeed
      expect(first_peep.id).to eq persisted_data.first['id']
      expect(first_peep.message).to eq "Where is Chi Chi"
      expect(first_peep.name).to eq "Goku"
    end

  end

end
