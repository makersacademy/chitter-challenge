require 'peep'

describe Peep do
  describe ".all" do
    it "returns all peeps made" do
      test_database_setup
      connection = PG.connect(dbname: 'chitter_test_database')
      connection.exec("INSERT INTO peeps(content, created_at) VALUES('Hello World!', NOW());")
      connection.exec("INSERT INTO peeps(content, created_at) VALUES('This breakfast is amazing!', NOW());")

      peeps = Peep.all

      expect(peeps).to include("Hello World!")
      expect(peeps).to include("This breakfast is amazing!")
    end
  end
end
