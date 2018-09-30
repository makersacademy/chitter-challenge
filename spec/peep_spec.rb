require 'peep'

describe Peep do
  context ".peep" do
    it "should store peep in database" do
      Peep.create(peep: "Test Peep")
      expect(Peep.get(1).peep).to eq "Test Peep"
    end
  end
end
