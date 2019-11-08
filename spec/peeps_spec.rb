require "./lib/peep"

describe Peep do
  describe ".all" do
    it "returns all peeps" do
      peeps = Peep.all

      expect(peeps).to include("This is a test Peep! Peep Peep Peep!")
      expect(peeps).to include("This is a second, even longer, test Peep! Peep Peep Peep!")
    end
  end
end
