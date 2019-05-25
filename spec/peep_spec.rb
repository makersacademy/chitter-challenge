require 'peep'

describe Peep do

  describe ".all" do

    it "returns a list of all peeps" do


    end
  end

  describe ".create" do

    it "creates a new peep" do
      peep = Peep.create(peep: "How do they make glass?")
      expect(Peep.all).to include "How do they make glass?"

    end
  end
end
