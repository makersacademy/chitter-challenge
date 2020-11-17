require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'creates a commention to a specific database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end
    it 'is a persistent connection' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'makes and SQL query on the database' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with('SELECT * FROM PEEPS;')
      DatabaseConnection.query('SELECT * FROM PEEPS;')
    end
  end
end
