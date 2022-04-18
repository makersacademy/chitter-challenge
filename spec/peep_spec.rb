require_relative '../lib/peep'
require_relative './database_helpers'

describe Peep do
  describe '.all' do
    it 'lists all peeps' do
      peep = Peep.create(content: 'This is a test peep!')
      Peep.create(content: 'This is another test peep!')
      Peep.create(content: 'Yet another test peep!')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'This is a test peep!'
      expect(peeps.first.time_created).to eq peep.time_created
    end
  end
  
  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(content: 'This is a test peep!')
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.content).to eq 'This is a test peep!'
    end
  end
end
