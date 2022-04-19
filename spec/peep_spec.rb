require_relative '../lib/peep'
require_relative './database_helpers'

describe Peep do
  describe '.all' do
    it 'returns peeps in reverse order' do
      peep = Peep.create(content: 'Chitter is cool!', username: 'Ray', name: 'Raymond Ray')
      Peep.create(content: 'An interesting message..', username: 'Lolz', name: 'Laurence Laurent')
      Peep.create(content: 'Blah blah blah', username: 'B Doggy', name: 'Brian the Dog (Dachshund)')

      peeps = Peep.all

      expect(peeps[2].content).to eq 'Chitter is cool!'
      expect(peeps[2]).to be_a Peep
      expect(peeps[2].id).to eq peep.id
      expect(peeps[2].username).to eq 'Ray'
      expect(peeps[2].name).to eq 'Raymond Ray'
      expect(peeps[1].content).to eq 'An interesting message..'
      expect(peeps[0].content).to eq 'Blah blah blah'
    end
  end

  describe '.create' do
    it 'creates a new peep with the time and username' do
      peep = Peep.create(content: 'What a day!', username: 'Pauline', name: 'Pauline French')
      persisted_data = persisted_data(table: 'peeps', id: peep.id)
      
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.content).to eq 'What a day!'
      expect(peep.username).to eq 'Pauline'
      expect(peep.name).to eq 'Pauline French'
      expect(peep.posted).to eq DateTime.parse(persisted_data['posted'])
    end
  end
end
