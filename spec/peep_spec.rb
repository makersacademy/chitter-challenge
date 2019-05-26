require 'peep'
require 'database_helpers'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(message: "hello")
      Peep.create(message: "world")
      peeps = Peep.all

      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'hello'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'My first peep')
      persisted_data = persisted_data(id: peep.id)
      expect(peep).to be_a Peep
      #expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'My first peep'
    end
  end

end
