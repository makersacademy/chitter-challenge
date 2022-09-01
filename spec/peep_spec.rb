require_relative '../lib/peep.rb'

describe Peep do
  subject(:peep) { described_class.new }

  it { is_expected.to respond_to(:new_peep) }

  describe '#new_peep' do 
    it 'can post a new peep' do
      peep.new_peep('Chloe', 'Chloeem', 'Hello, world!')

      expect(peep.peeps[0]).to include 'Chloe', 'Chloeem', 'Hello, world!'
    end
  end
end
