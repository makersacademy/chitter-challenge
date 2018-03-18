require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps, wrapped in peep instances' do
      peeps = Peep.all
      peeps = peeps.map(&:peep)

      expect(peeps).to include("peep1")
      expect(peeps).to include("peep2")
      expect(peeps).to include("peep3")
    end
  end
end

describe '.create' do
  it 'creates a new peep' do
    Peep.create(peep: 'This is my first peep')
    peeps = Peep.all
    peeps = peeps.map(&:peep)

    expect(peeps).to include 'This is my first peep'
  end
end
