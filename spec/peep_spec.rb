require 'pg'
require "peep"

describe Peep do
  describe ".all" do
    it "returns all peeps from the database" do
      connection = PG.connect(dbname: 'chitter_test')

      # Add test data
      connection.exec("INSERT INTO peeps (message) VALUES ('Test peep');")

      peeps = Peep.all
      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq "Test peep"
    end
  end
end