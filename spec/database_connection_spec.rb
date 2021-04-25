require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up the connection to database through pg' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      
      DatabaseConnection.setup 'chitter_test'
    end

    it 'database connection is persistent' do
      connection = DatabaseConnection.setup 'chitter_test'

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes a query' do
      connection = DatabaseConnection.setup('chitter_test')

      expect(connection).to receive(:exec).with('SELECT * FROM peeps;')

      DatabaseConnection.query('SELECT * FROM peeps;')
    end
  end
end
