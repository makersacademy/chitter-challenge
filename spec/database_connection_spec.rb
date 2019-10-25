require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitterdb_test')

      DatabaseConnection.setup('chitterdb_test')
    end

    it 'this connection is persistent' do
      connection = DatabaseConnection.setup('chitterdb_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('chitterdb_test')

      expect(connection).to receive(:exec).with("SELECT * FROM tblchitters")

      DatabaseConnection.query("SELECT * FROM tblchitters")
    end
  end
end
