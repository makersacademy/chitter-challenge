require "peep"

describe Peep do
  describe ".all" do
    it "shows all peeps" do
      Peep.create(text: "First peep!")
      Peep.create(text: "Another peep!")
      peeps = Peep.all

      expect(peeps).to include "First peep!"
      expect(peeps).to include "Another peep!"
    end
  end

  describe ".create" do
    it "creates a peep" do
      Peep.create(text: "First peep!")
      expect(Peep.all).to include "First peep!"
    end
  end
end
