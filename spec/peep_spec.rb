require 'peep'

describe Peep do

  describe '#all' do
    it 'returns peeps' do
      expect(Peep.all).to be_a(Array)
    end
  end
end
