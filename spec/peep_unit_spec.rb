require 'peep'

describe Peep do

  describe ".all" do
    it "outputs a list of peeps" do
      peeps = Peep.all

      expect(peeps[0]['comment']).to include("this is peep1")
      expect(peeps[1]['comment']).to include("this is peep2")
    end

  end

end