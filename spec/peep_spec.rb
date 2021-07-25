require 'peep'

describe Peep do
  describe '.all' do
    it 'contains all the peeps' do
    Peep.add('one')
    Peep.add('two')
    Peep.add('three')
    peeps = Peep.all
      expect(peeps).to include 'one'
      expect(peeps).to include 'two'
      expect(peeps).to include 'three'
      expect(peeps.length).to eq 3
    end
  end

  describe '.add' do
    it 'adds a peep' do
      Peep.add('Adding a peep')
      expect(Peep.all).to include 'Adding a peep'
    end
  end
  end


  