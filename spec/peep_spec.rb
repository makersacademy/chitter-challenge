require './lib/peep'

describe Peep do
  describe '.all' do
    it 'shows peeps' do
      peeps = Peep.all
      expect(peeps.first).to be_a Peep
    end
  end

  describe '.create' do
    it 'shows inputed peep' do
      peep = Peep.create(peep: 'Failure is success in progress')

      expect(peep.peep).to eq('Failure is success in progress')
    end
  end
end
