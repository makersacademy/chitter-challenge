require 'chitter'

describe Chitter do

  describe '.all_peeps' do

    it 'returns all peeps' do
      Chitter.peep('First peep')
      Chitter.peep('Second peep')
      Chitter.peep('Third peep')

      expect(Chitter.all_peeps).to include("First peep")
      expect(Chitter.all_peeps).to include("Second peep")
      expect(Chitter.all_peeps).to include("Third peep")
    end

  end

  describe '.peep' do

    it 'creates a new peep' do
      Chitter.peep('Example peep')
      expect(Chitter.all_peeps).to include('Example peep')
    end

  end

end
