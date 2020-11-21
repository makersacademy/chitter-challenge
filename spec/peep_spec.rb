require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'describes the peeps' do
      test = Peep.create(text: 'Test 1')
      Peep.create(text: 'Test 2')
      Peep.create(text: 'Test 3')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.last.id).to eq test.id
      expect(peeps.first.text).to eq 'Test 3'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(text: 'Test 1')
      persisted_data = peep_persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq 'Test 1'
    end
  end
end
