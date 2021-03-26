require 'chitter'

describe Chitter do
  describe '#send_peep' do
    it 'records the peep in the chitter db table peeps' do
      Chitter.send_peep('My first peep!', '1')
      expect(Chitter.all_peeps.last.message).to eq('My first peep!')
    end
  end
end
