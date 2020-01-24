require 'chitter'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      @peeps = Peep.all

      expect(peep).to include("peep1")
      expect(peep).to include("peep2")
    end
  end
end