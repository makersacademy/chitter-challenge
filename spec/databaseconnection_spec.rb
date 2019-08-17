require 'databaseconnection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to the database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'peeps_test')

      DatabaseConnection.setup('peeps_test')
    end
  end

  describe '.connection' do
    it 'this connection is persistent' do

      connection = DatabaseConnection.setup('peeps_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('peeps_test')
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")

      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end
