require 'peep'

describe Peep do
  
  describe ".view" do
    it "returns all peeps" do
      peeps = Peep.view
      expect(peeps).to include("First peep")
      expect(peeps).to include("Second peep")
      expect(peeps).to include("Third peep")
    end
  end

end