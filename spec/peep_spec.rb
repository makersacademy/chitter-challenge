require "peep"

describe Peep do
  describe ".all" do
    it "shows all peeps" do
      connection = PG.connect(dbname: "chitter_test")

      connection.exec("INSERT INTO peeps VALUES (1,'First peep!');")

      connection.exec("INSERT INTO peeps VALUES (2,'Another peep!');")
      peeps = Peep.all

      expect(peeps).to include("First peep!")
      expect(peeps).to include("Another peep!")
    end
  end
end
