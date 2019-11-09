require 'peep'

describe Peep do
  describe '.all' do

    it 'returns all peeps' do
      all_peeps = Peep.all

      expect(all_peeps).to include("Test Peep 1")
      expect(all_peeps).to include("Test Peep 2")
      expect(all_peeps).to include("Test Peep 3")
    end

  end

end
