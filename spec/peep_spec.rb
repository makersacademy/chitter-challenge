require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include("Hello")
      expect(peeps).to include("Ciao ragazzi")
      expect(peeps).to include("I love coding weekends")
    end
  end
end
