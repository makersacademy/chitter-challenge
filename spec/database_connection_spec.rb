require 'database_connection'

describe DatabaseConnection do

  it "should setup a connection to the database" do
    expect(PG).to receive(:connect).with(dbname: 'chitter_test')
    DatabaseConnection.setup('chitter_test')
  end

  it "should have a persistent connection" do
    test_connection = DatabaseConnection.setup('chitter_test')
    expect(DatabaseConnection.connection).to eq test_connection
  end

  context ".query"

  it "executes a query" do
    connection = DatabaseConnection.setup('chitter_test')
    expect(connection).to receive(:exec_params).with("SELECT * FROM bookmarks", [])
    DatabaseConnection.query("SELECT * FROM bookmarks")
  end

end
