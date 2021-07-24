require 'peep'
require 'database_helpers'

describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(text: 'Here is a test peep')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a(Peep)
      expect(peep.id).to eq(persisted_data['id'])
      expect(peep.text).to eq('Here is a test peep')
      expect(peep.time).to eq(persisted_data['time'])
    end
  end

  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(text: 'Test peep')
      Peep.create(text: 'Second test peep')
      Peep.create(text: 'Third test peep')
      peeps = Peep.all

      expect(peeps.length).to eq(3)
      expect(peeps.first).to be_a(Peep)
      expect(peeps.first.id).to eq(peep.id)
      expect(peeps.first.time).to eq(peep.time)
      expect(peeps.first.text).to eq(peep.text)
    end
  end
end
