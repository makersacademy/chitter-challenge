require "peep"
require_relative "./setup_test_database.rb"

describe Peep do
  describe ".all" do
    it "returns all peeps" do
      connection = PG.connect(dbname: "chitter_test")

      # Add the test data
      connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep');")
      connection.exec("INSERT INTO peeps VALUES(2, 'This is another peep');")
      connection.exec("INSERT INTO peeps VALUES(3, 'This is the lucky third peep');")

      peeps = Peep.all

      expect(peeps).to include("This is a peep")
      expect(peeps).to include("This is another peep")
      expect(peeps).to include("This is the lucky third peep")
    end
  end
end
