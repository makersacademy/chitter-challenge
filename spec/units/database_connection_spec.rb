require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter')
      DatabaseConnection.setup('chitter')
    end
    it 'checks this connection is persistent' do
      connection = DatabaseConnection.setup('chitter_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('chitter')

      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")

      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end