require './lib/peep'

describe Peep do
  describe ".all" do
    it "returns all peeps" do
      peeps = Peep.all

      expect(peeps).to include("I just ate an apple")
      expect(peeps).to include("Chitter is the best")
      expect(peeps).to include("Howdy")

    end
  end
end
