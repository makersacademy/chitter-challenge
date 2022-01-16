require 'peep'

describe Peep do 
  describe '.all' do 
    it 'returns list of all peeps' do 
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      peep = Peep.add(content: 'Un ingeniero de software creó un juego para su pareja, ahora es una sensación en internet.', user: 'kbrooks', handle: '@kb')
      Peep.add(content: 'sjybarturn - the sound of the sea lapping peacefully against the shore, Norwegian.', user: 'rmacfarlane', handle: '@rmac')
      Peep.add(content: 'And theres a hand, my trusty fiere! And gies a hand o thine!', user: 'robertburns', handle: '@burns')

      peeps = Peep.all #array of hashes?
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id 
      expect(peeps.first.content).to eq 'Un ingeniero de software creó un juego para su pareja, ahora es una sensación en internet.'
      expect(peeps.first.user).to eq 'kbrooks'
    end 
  end

  describe '.add' do 
    it 'posts a peep and adds to peeps db table' do 
      peep = Peep.add(content: 'test peep content', user: 'test username' , handle: '@test')
      persisted_data = persisted_data(id: peep.id, table: :peeps) 

      expect(peep).to be_a Peep 
      expect(peep.id).to eq persisted_data['id']
      # expect(peep.timestamp). to
    end
  end 

  describe '.sort_all_peeps' do 
    it 'sorts all peeps reverse chronologically by peep.time i.e. most recent peep becomes first element' do 
      older_peep = Peep.add(content: 'older peep content', user: 'old username' , handle: '@test')
      allow(Time).to receive(:now).and_return(Time.now + 1*60*60 ) #adds 1hr onto Time.now which will apply when Time.now is called in the creation of the newer_peep on line below
      newer_peep = Peep.add(content: 'newer peep content', user: 'new username' , handle: '@test')
      
      sorted_peeps = Peep.sort_all_peeps
      expect(sorted_peeps.first.content).to eq 'newer peep content'

    end
  end 
end