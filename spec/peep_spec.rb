require 'peep'

describe Peep do
  describe '.all' do
    it "returns all peeps" do
      peeps = Peep.all

      expect(peeps).to include("Fake news!")
      expect(peeps).to include("Sun's out, guns out")
    end
  end
end
