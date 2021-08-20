require 'peep'

describe Peep do 
  describe '#self.add' do
    it 'allows user to add a peep' do
      expect(described_class).to respond_to(:add).with(1).argument
    end
  end
end
