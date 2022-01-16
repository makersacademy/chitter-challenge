require 'peep'

describe Peep do
  describe '#peep' do
    let(:subject) { Peep.new("World's smartest peep") }
    it 'returns the peep as a string' do
      expect(subject.peep).to eq("World's smartest peep") 
    end
  end
end
