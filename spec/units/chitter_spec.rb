require 'chitter'
describe Chitter do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Chitter.all

      expect(peeps).to include("peep_1")
      expect(peeps).to include("peep_2")
      expect(peeps).to include("peep_3")
    end
  end
end
