require 'peeps'
require 'persisted_data'

describe Peeps do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peeps.create(peep: "First peep")
      persisted_data = persisted_data(id: peep.id)
      
      expect(peep).to be_a Peeps
      expect(peep.peep).to eq 'First peep'
      expect(peep.id).to eq persisted_data['id']
    end
  end
end
