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

  describe '.all' do
    it 'returns a list of all peeps' do
      # Add test peeps
      peep = Peep.create(content: 'Test peep')
      Peep.create(content: 'Second peep')
      Peep.create(content: 'A third peep')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'Test peep'
    end
  end
  
end
