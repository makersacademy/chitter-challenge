require 'peep'
require 'database_helpers'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      # Add the test data
      Peep.create(peep_text: 'This is a peep')
      Peep.create(peep_text: 'Peep peep!')
      peep = Peep.create(peep_text: 'peeping away 🐥')
      
      peeps = Peep.all
      
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.peep_id).to eq peep.peep_id
      expect(peeps.first.peep_text).to eq 'peeping away 🐥'
      expect(peeps.first.peeped_on).to eq peep.peeped_on
    end

    it 'returns peeps in reverse chronological order' do
      Peep.create(peep_text: 'This is a peep')
      Peep.create(peep_text: 'Peep peep!')
      Peep.create(peep_text: 'peeping away 🐥')
      peeps = Peep.all

      expect(peeps.first.peep_text).to eq 'peeping away 🐥'

      Peep.create(peep_text: 'This is a newer peep')
      peeps = Peep.all

      expect(peeps.first.peep_text).to eq 'This is a newer peep'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peep_text: "Test my peep.")
      persisted_data = persisted_data(peep_id: peep.peep_id)

      expect(peep).to be_a Peep
      expect(peep.peep_id).to eq persisted_data['peep_id']
      expect(peep.peep_text).to eq "Test my peep."
      expect(peep.peeped_on).to eq persisted_data['peeped_on']
    end
  end
end
