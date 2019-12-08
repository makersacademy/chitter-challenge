require 'peep'

describe Peep do
  describe ".all" do
    it "returns all peeps made" do
      # connection = PG.connect(dbname: 'chitter_test_database')
      # connection.exec("INSERT INTO peeps(content) VALUES('Hello World!');")
      # connection.exec("INSERT INTO peeps(content) VALUES('This breakfast is amazing!');")

      peeps = Peep.all

      expect(peeps).to include("Hello World!")
      expect(peeps).to include("This breakfast is amazing!")
    end
  end
end
