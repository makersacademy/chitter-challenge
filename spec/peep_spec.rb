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

    it "returns peeps in reverse chronological order (newest first)" do
      connection = PG.connect(dbname: 'chitter_test')

      # Add test data
      connection.exec("INSERT INTO peeps (message) VALUES ('Oldest peep');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Middle peep');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Newest peep');")

      peeps = Peep.all
      expect(peeps.length).to eq 3
      expect(peeps.first.message).to eq "Newest peep"
    end
  end
end