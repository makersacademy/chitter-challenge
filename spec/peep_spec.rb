require 'peep'
require 'database_helpers'

describe Peep do
  describe '.create' do
    it 'creates a peep' do
      peep = Peep.create(content: 'Test peep')
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.content).to eq 'Test peep'
    end
  end
  
end