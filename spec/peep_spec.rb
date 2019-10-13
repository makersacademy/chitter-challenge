require 'peep'

describe Peep do
  describe '.all' do
    it 'stores all peeps' do
      peeps = Peep.all

      expect(peeps).to include 'This is Peep 1'
      expect(peeps).to include 'This is Peep 2'
    end
  end
end
