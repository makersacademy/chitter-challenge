require 'peep'

describe Peep do

  describe ".all" do
    it "outputs a list of peeps" do
      peeps = Peep.all

      expect(peeps).to include("this is peep1")
      expect(peeps).to include("this is peep2")
    end

  end

end