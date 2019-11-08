require 'database_connection'

describe DatabaseConnection do
  context "Connecting to the database" do
    it "connects to a database" do
      expect(DatabaseConnection.setup("bitter")).to be_a(PG::Connection)
    end
  end

  context "making a query" do
    it 'makes a query to the database' do
      conn = DatabaseConnection.setup("bitter_test")
      expect(DatabaseConnection.query("SELECT * FROM beets")).to be_a(PG::Result)
    end
  end
end