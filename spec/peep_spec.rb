require "./lib/peep"

describe Peep do
  describe "#all" do
    it "returns all peeps" do
      connection = PG.connect(dbname: "chitter_test")

      connection.exec("INSERT INTO peeps (peeps) VALUES ('First peep');")

      peeps = Peep.all

      expect(peeps).to include ("First peep")
    end
  end

  describe "#add_peep" do
    it "creates a new bookmark" do
      Peep.add_peep(peep: "I love coding!")

      expect(Peep.all).to include "I love coding!"
    end
  end
end
