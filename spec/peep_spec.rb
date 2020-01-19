require 'peep'

describe Peep do
  
  describe ".view" do

    it "returns all peeps" do

      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (body) VALUES ('Test peep one');")
      connection.exec("INSERT INTO peeps (body) VALUES ('Test peep two');")

      peeps = Peep.view
      expect(peeps).to include("Test peep one")
      expect(peeps).to include("Test peep two")
    end
  end

  describe ".create" do
    it "creates a new peep" do
      Peep.create("Test Peep")
      expect(Peep.view).to include("Test Peep")
    end
  end

end
