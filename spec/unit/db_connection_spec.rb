require 'db_connection'

describe DatabaseConnection do

  context "setup" do
    it "sets up connection to database" do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end

    it "ensures connection is persistent" do
      connection = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  context "query" do
    it "executes sql query to database" do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with("SELECT * FROM chitter_posts;")
      DatabaseConnection.query("SELECT * FROM chitter_posts;")
    end
  end
end
