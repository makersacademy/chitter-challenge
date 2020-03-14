require 'database_connection'

describe DatabaseConnection do
  
  describe ".query" do

    it "executes a query via PG" do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")
      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end

  it "sets up a connection to a database through PG" do
    expect(PG).to receive(:connect).with(dbname: 'chitter_test') 
    DatabaseConnection.setup('chitter_test')
  end

  it "has a persistant connection" do
    connection = DatabaseConnection.setup('chitter_test')
    expect(DatabaseConnection.connection).to eq connection
  end

end
