require 'peep'

describe Peep do
  describe '.all' do
    it 'reurns an array of peeps frorm database' do
      peep = Peep.create(text: 'first peep')
      Peep.create(text: 'second peep')
      Peep.create(text: 'third peep')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq 'first peep'
    end
  end

  describe '.create' do
    it 'creates and returns a new peep' do
      peep = Peep.create(text: 'test peep')

      expect(peep).to be_a Peep
      expect(peep.text).to eq 'test peep'
    end
  end
end
