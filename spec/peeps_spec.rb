require 'peeps'
require 'database_helpers'

describe Peeps do
  describe '.create' do
    it 'creates a new peep' do
      time = Time.now
      peep = Peeps.create(message: "Test",time: time)
      persisted_data = persisted_data(id: peep.id, table: 'peep')

      expect(peep.message).to eq "Test"
      expect(peep.id).to eq persisted_data.first['id']
    end
  end
    describe '.all' do
      it 'returns all peeps' do
        time = Time.now
        Peeps.create(message: "Another Test",time: time )
        Peeps.create(message: "Different Test",time: time)
        peeps = Peeps.all

      expect(peeps.length).to eq 2
    end
  end
end
