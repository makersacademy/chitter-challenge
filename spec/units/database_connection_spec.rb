require "database_connection"

describe DatabaseConnection do

  describe ".setup" do
    it "Sets up a connection to the specififed database" do
      allow(PG).to receive(:connect).with(dbname: "chitter_test")
      DatabaseConnection.setup("chitter_test")
    end
  end

# Test no longer needed given that .query tests persistent connection to database
  describe ".connection" do
    it "Maintains a persistent connection to the specified database" do
      connection = DatabaseConnection.setup("chitter_test")
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe ".query" do
    it "Excutes a query via PG" do
      connection = DatabaseConnection.setup("chitter_test")
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")
      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end
