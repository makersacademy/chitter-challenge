require 'peep'

describe Peep do
  
  describe ".view" do

    it "returns all peeps" do
      Peep.create("Test peep one")
      Peep.create("Test peep two")
      expect(Peep.view).to include("Test peep one")
      expect(Peep.view).to include("Test peep two")
    end
  end

  describe ".create" do
    it "creates a new peep" do
      Peep.create("Test Peep")
      expect(Peep.view).to include("Test Peep")
    end
  end

end
