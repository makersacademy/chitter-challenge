require 'database_connection'

describe DatabaseConnection do

  describe '#self.setup' do
    it 'sets up a connection to a database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end

    it 'this connection is persistent' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '#self.query' do
    it 'executes a SQL query in the currently connected database' do
      sql_query = 'SELECT * FROM links'
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with sql_query
      DatabaseConnection.query(sql_query)
    end
  end

end
