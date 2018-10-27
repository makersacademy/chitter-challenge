require "Databaseconnection"
require "pg"

describe Databaseconnection do

  describe ".setup" do
    it "establishes a connection using PG and returns and object of type connection" do
      expect(PG).to receive(:connect).with(dbname: "chitter_test")
      connection = described_class.setup("chitter_test")
    end

    it "the connection is persistent" do
      connection = described_class.setup("chitter_test")
      expect(described_class.connection).to eq connection
    end
  end

  describe ".execute" do
    it "executes a query string using PG and returns results" do
      str = "select * from user"
      connection = described_class.setup("chitter_test")
      expect(connection).to receive(:exec).with(str)
      described_class.execute(str)
    end
  end

end
