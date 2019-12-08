require 'peep'

describe Peep do
  describe ".all" do
    it "returns all peeps made in reverse chronological order" do
      test_database_setup
      
      connection = PG.connect(dbname: 'chitter_test_database')
      connection.exec("INSERT INTO peeps(content, created_at) VALUES('Hello World!', NOW());")
      connection.exec("INSERT INTO peeps(content, created_at) VALUES('This breakfast is amazing!', NOW());")

      peeps = Peep.all

      expect(peeps.first).to eq("This breakfast is amazing!")
      expect(peeps).to include("Hello World!")
    end
  end
end
