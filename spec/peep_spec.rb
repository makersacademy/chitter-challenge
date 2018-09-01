require "./lib/peep"

describe Peep do
  
  describe ".add" do
    it "adds a new peep" do
      Peep.add("This is a post.")
      expect(Peep.all).to include("This is a post.")
    end
  end

  describe ".all" do
    it "will return the body of the peep" do
      Peep.add("This is a post.")
      expect(Peep.all).to include("This is a post.")
    end
  end
end
