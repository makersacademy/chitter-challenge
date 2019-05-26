require 'database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it 'should set up a connection to the database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end

    it 'should be a persistent connection' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq(connection)
    end
  end

  describe '#query' do
    it 'should execute a query' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with('SELECT * FROM peeps;')
      DatabaseConnection.query('SELECT * FROM peeps;')
    end
  end
end
