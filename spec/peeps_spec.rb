require "./lib/peep"

describe Peep do
  describe ".all" do
    it "returns all peeps" do
      connection = PG.connect(dbname: "chitter_test")
      connection.exec("INSERT INTO peeps (peep) VALUES ('This is a test Peep! Peep Peep Peep!');")
      connection.exec("INSERT INTO peeps (peep) VALUES('This is a second, even longer, test Peep! Peep Peep Peep!');")
      peeps = Peep.all

      expect(peeps).to include("This is a test Peep! Peep Peep Peep!")
      expect(peeps).to include("This is a second, even longer, test Peep! Peep Peep Peep!")
    end
  end
end
