require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      res = peeps.map(&:txt)
      expect(res).to include("0th")
      expect(res).to include("1st")
      expect(res).to include("2nd")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(txt: 'New')
      peeps = Peep.all
      res = peeps.map(&:txt)
      expect(res).to include 'New'
    end
  end
end
