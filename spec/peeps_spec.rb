require 'peeps'
require 'database_helpers'

describe Peeps do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peeps.create(message: "Test")
      persisted_data = persisted_data(id: peep.id)

      expect(peep.message).to eq "Test"
      expect(peep.id).to eq persisted_data['id']
    end
  end
    describe '.all' do
      it 'returns all peeps' do
        Peeps.create(message: "Another Test")
        Peeps.create(message: "Different Test")
        peeps = Peeps.all

      expect(peeps.length).to eq 2
    end
  end
end
