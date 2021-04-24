require 'peep'

describe Peep do
  context '#create' do
    it 'can create new peeps' do
      post = Peep.create(peep: 'Hello world')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{post.id};")
        
      expect(post).to be_a Peep
      expect(post.id).to eq persisted_data.first['id']
      expect(post.peep).to eq 'Hello world'
    end
  end 

  context '#all' do
    it 'can display the created peep' do
      post = Peep.create(peep: 'Hello world')
      Peep.create(peep: 'I have arrived')
      

      feed = Peep.all
      
      expect(feed.first).to be_a Peep
      expect(feed.length).to eq 2
      expect(feed.first.id).to eq post.id
      expect(feed.first.peep).to eq 'Hello world'
    end 
  end 
end
