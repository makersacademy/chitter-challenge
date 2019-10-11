require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all the peeps' do
      peeps = Peep.all

      expect(peeps).to include('This is a test peep')
      expect(peeps).to include('This is a test peep 2')
    end
  end
end
