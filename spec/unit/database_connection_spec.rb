require 'database_connection'

describe DatabaseConnection do
  it "connects to a specified database" do
    expect(PG).to receive(:connect).with(dbname: 'chitter_test')
    DatabaseConnection.setup('chitter_test')
  end

  it "has a persistent connection" do
    connection = DatabaseConnection.setup('chitter_test')
    expect(connection).to eq(DatabaseConnection.connection)
  end

  it "sends a query" do
    connection  = DatabaseConnection.setup('chitter_test')
    expect(connection).to receive(:exec).with("SELECT *;")
    DatabaseConnection.query('SELECT *;')
  end
end