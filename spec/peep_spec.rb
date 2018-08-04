require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      Peep.create('Is this real life?')
      expect(Peep.all).to include 'Is this real life?'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create('Is this just fantasy?')
      expect(Peep.all).to include 'Is this just fantasy?'
    end
  end
end
