require 'database_connection'

describe DatabaseConnection do

  it 'sets up a connection to a database through PG' do
    expect(PG).to receive(:connect).with(dbname: 'chitter_test')
    DatabaseConnection.setup('chitter_test')
  end

  it 'this connection is persistent' do
    connection = DatabaseConnection.setup('chitter_test')
    expect(DatabaseConnection.connection).to eq connection
  end

  it 'executes a query via pg' do
    connection = DatabaseConnection.setup('chitter_test')
    expect(connection).to receive(:exec).with("SELECT * FROM peeps1;")
    DatabaseConnection.query("SELECT * FROM peeps1;")
  end

end
