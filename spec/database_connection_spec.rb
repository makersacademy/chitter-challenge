require_relative '../models/database_connection'
require 'pg'

describe DatabaseConnection do
  describe "#.setup" do
    it "sets up a connection to the database through pg" do
      expect(PG).to receive(:connect).with(dbname: 'peep_manager_test')
      DatabaseConnection.setup("peep_manager_test")
    end
  end
  
    it "this connection is persistent" do
      #Grab the connection as a return value from the setup method
      connection = DatabaseConnection.setup("peep_manager_test")
      expect(DatabaseConnection.connection).to eq connection
    end
  
  describe "#.query" do
    it "executes a query via PG" do
      connection = DatabaseConnection.setup("peep_manager_test")
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")
      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end