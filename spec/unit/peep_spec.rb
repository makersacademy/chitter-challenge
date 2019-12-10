require 'peep'
require 'database_helpers'

describe Peep do

  describe '.all' do
    it 'returns all the peeps' do
      peep = Peep.create(name: 'John Smith', handle: 'js2019', message: 'This is a test peep')
      Peep.create(name: 'John Smith', handle: 'js2019', message: 'This is a test peep 2')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peep).to be_a Peep
      expect(peep.message).to eq 'This is a test peep'
      expect(peep.name).to eq 'John Smith'
      expect(peep.handle).to eq 'js2019'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(name: 'John Smith', handle: 'js2019', message: 'test message')

      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'test message'

    end
  end
end
