require './lib/peep'
require './spec/database_helpers'

describe Peep do
  
  describe '.add' do
    it 'add a Peep to the database and returns an instance of Peep' do
      peep = Peep.add(content: 'My first peep!')
      persisted_data = persisted_data(peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data[0]['id']
      expect(peep.content).to eq 'My first peep!'
      expect(peep.created_at?).to eq persisted_data[0]['created_at']
    end
  end

  describe '.get_all' do 
    it 'retrieves all peeps from database in reverse chronological order' do
      Peep.add(content: 'First Peep!')
      Peep.add(content: 'Second Peep!')
      most_recent_peep = Peep.add(content: 'Third Peep!')

      peeps = Peep.get_all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq most_recent_peep.id
      expect(peeps.first.content).to eq most_recent_peep.content
      expect(peeps.first.created_at?).to eq most_recent_peep.created_at?
    end
  end
end
