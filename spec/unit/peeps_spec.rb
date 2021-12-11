require 'peeps'

describe Peep do
  describe '#view all peeps' do
    it 'shows all posted peeps on feed ' do
      peeps = Peep.all
      expect(peeps).to include("First peep")
      expect(peeps).to include("Second peep")
      expect(peeps).to include("Third peep")
    end
  end

end