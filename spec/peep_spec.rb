require 'peep'

describe Peep do
  describe ".all" do
    it "returns all peeps made in reverse chronological order" do
      test_database_setup

      Peep.create("Hello World!")
      Peep.create("This breakfast is amazing!")
      Peep.create("I just read the most interesting article")

      peeps = Peep.all

      expect(peeps.first).to eq("I just read the most interesting article")
      expect(peeps).to include("This breakfast is amazing!")
      expect(peeps.last).to eq("Hello World!")
    end
  end

  describe ".create" do
    it "creates a new peep" do
      test_database_setup

      Peep.create("I am obsessed with this new pizza joint!")

      peeps = Peep.all

      expect(peeps.first).to eq "I am obsessed with this new pizza joint!"
    end
  end
end
