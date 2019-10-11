require 'chitter'

describe Chitter do

  describe '.all_peeps' do

    it 'returns all peeps' do
      peeps = Chitter.all_peeps

      expect(peeps).to include("First peep")
      expect(peeps).to include("Second peep")
      expect(peeps).to include("Third peep")
    end

  end
  
end
