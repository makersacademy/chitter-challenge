require 'database_connection'

describe DatabaseConnection do

  describe "#setup" do
    it "should set up a connection to a database via PG" do
      expect(PG).to receive(:connect).with(dbname: 'peeps_test')

      DatabaseConnection.setup('peeps_test')
    end
  end

  describe "#query" do
    it "executes a query via PG" do
      connection = DatabaseConnection.setup('peeps_test')

      expect(connection).to receive(:exec).with("SELECT * FROM messages;")

      DatabaseConnection.query("SELECT * FROM messages;")
    end
  end

end
