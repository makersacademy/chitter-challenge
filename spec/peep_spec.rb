require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("http://www.makersacademy.com")
      expect(peeps).to include("http://www.destroyallsoftware.com")
      expect(peeps).to include("http://www.google.com")
    end
  end
end