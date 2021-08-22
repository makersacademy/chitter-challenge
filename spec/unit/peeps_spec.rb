require 'peeps'

describe Peeps do
  describe '.all' do
    it 'should return all peeps' do
      peeps = Peeps.all

      expect(peeps).to include('my first peep')
      expect(peeps).to include('my second peep')
    end
  end
end