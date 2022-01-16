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
      persisted_data = persisted_data(id: peep.id) 

      expect(peep).to be_a Peep 
      expect(peep.id).to eq persisted_data['id']
      # expect(peep.timestamp). to
    end
  end 
end