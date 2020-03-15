require 'peep'

describe Peep do
  describe '#posted_peeps' do
    it 'shows all peeps posted' do
      peeps = Peep.posted_peeps
      expect(peeps).to include("This is a peep")
      expect(peeps).to include("Another peep")
      expect(peeps).to include("Never gets old")
    end
  end
end
