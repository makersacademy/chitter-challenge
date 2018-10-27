require 'peep'
require 'database_helpers'

describe Peep do
  describe '#view_all_peeps' do
    it 'returns all peeps' do

    # Add the test data
      peep = Peep.new_peep(message: 'This is a peep')
      Peep.new_peep(message: 'This is another peep')
      Peep.new_peep(message: 'This is a third peep')

      peeps = Peep.view_all_peeps

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'This is a peep'
      expect(peeps.first.created_at).to eq peep.created_at
    end
  end

  describe '#new_peep' do
    it 'creates a new peep' do
      peep = Peep.new_peep(message: 'Test peep')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'Test peep'
      expect(peep.created_at).to eq persisted_data['created_at']
    end
  end
end
