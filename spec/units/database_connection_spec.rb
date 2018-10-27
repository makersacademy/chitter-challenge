require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it "sets up a connection to the db" do
      DatabaseConnection.setup(dbname: 'chitter_test')
      expect(DatabaseConnection.connection).to be_a PG::Connection
    end

    it "creates a persistant connection" do
      connection = DatabaseConnection.setup(dbname: 'chitter_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it "executes a SQL query" do
      connection = DatabaseConnection.setup(dbname: 'chitter_test')
      expect(connection).to receive(:exec).with("SELECT * FROM peep;")

      DatabaseConnection.query("SELECT * FROM peep;")
    end
  end
end
