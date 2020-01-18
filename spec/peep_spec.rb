require 'peep'

describe Peep do
  
  describe ".view" do
    it "returns all peeps" do
      peeps = Peep.view.join(" ")
      expect(peeps).to include("First post!")
      expect(peeps).to include("Second post!")
      expect(peeps).to include("Third post!")
    end
  end

end