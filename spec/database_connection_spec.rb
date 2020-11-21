require 'database_connection'
require 'pg'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_manager_test')

      DatabaseConnection.setup('chitter_manager_test')
    end
  end

  it 'this connection is persistent' do
  connection = DatabaseConnection.setup('chitter_manager_test')

  expect(DatabaseConnection.connection).to eq connection
end
end

describe '.query' do
  it 'executes a query via PG' do
    connection = DatabaseConnection.setup('chitter_manager_test')

    expect(connection).to receive(:exec).with("SELECT * FROM chitter;")

    DatabaseConnection.query("SELECT * FROM chitter;")
  end
end
