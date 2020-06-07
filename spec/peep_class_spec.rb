require "peep"

describe Peep do
  describe ".all" do
    it "returns a list of peeps" do
      Peep.create(message: "Hello everyone!")
   
      peeps = Peep.all

      expect(peeps).to include("Hello everyone!")
    end
  end

  describe ".create" do
    it "creates a new peep" do
      Peep.create(message: "Hello everyone!")

      expect(Peep.all).to include("Hello everyone!")
    end
  end


end