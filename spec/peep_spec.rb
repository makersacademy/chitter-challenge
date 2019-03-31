require "peep"

describe Peep do
  describe ".all" do
    it "returns all peeps from the database" do
      # Add test data
      Peep.create(message: "Test peep")
      Peep.create(message: "Second test peep")

      peeps = Peep.all
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq "Second test peep"
      expect(peeps.first.created_at).to be_a String
    end

    it "returns peeps in reverse chronological order (newest first)" do
      # Add test data
      Peep.create(message: "Oldest peep")
      Peep.create(message: "Middle peep")
      Peep.create(message: "Newest peep")

      peeps = Peep.all
      expect(peeps.length).to eq 3
      expect(peeps.first.message).to eq "Newest peep"
    end
  end

  describe ".create" do
    it "creates a new peep post" do
      Peep.create(message: "My very first peep, people!")
      expect(Peep.all[0].message).to include "My very first peep, people!"
    end
  end
end
