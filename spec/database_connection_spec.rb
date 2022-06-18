require 'database_connection'

describe DatabaseConnection do 

  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_chatter_test')

      DatabaseConnection.setup('chitter_chatter_test')
    end
  end

  describe '.connection' do
    it 'this connection is persistent' do
      connection = DatabaseConnection.setup('chitter_chatter_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes a query via PG object' do
      connection = DatabaseConnection.setup('chitter_chatter_test')

      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")

      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end