require "peep"

describe Peep do
  describe "#all" do
    it "returns all peeps" do
      connection = PG.connect(dbname: "chitter_test")

      connection.exec("INSERT INTO peeps (peeps) VALUES ('First peep');")

      peeps = Peep.all

      expect(peeps).to include ("First peep")
    end
  end
end
