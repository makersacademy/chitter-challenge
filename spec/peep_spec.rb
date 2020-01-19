require 'peep'
require 'timecop'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include('My first peep')
      expect(peeps).to include('140 character limit')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(peep: 'a new peep')
      expect(Peep.all).to include 'a new peep'
    end
  end

  describe '.reverse_order' do
    Peep.create(peep: 'this is a peep')
    
  end
end