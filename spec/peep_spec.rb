require 'peep'

describe Peep do

  peeps = described_class.all  

  describe ".all" do
    it "Returns a list of all peeps" do
      expect(peeps).to include("This is my first ever peep!")
      expect(peeps).to include("This is my second peep!")
      expect(peeps).to include("This is my third peep!")
    end
  end

  describe ".create" do
    it "Creates a new peep" do
      Peep.create("Hello this is a new peep")
      expect(peeps).to include("Hello this is a new peep")
    end
  end
end
