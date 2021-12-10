require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up connection to test database' do
      expect(PG).to receive(:connect).with({ dbname: 'chitter_test' })
      DatabaseConnection.setup
    end

    it 'sets up connection to production database' do
      ENV['ENVIRONMENT'] = 'production'
      expect(PG).to receive(:connect).with({ dbname: 'chitter' })
      DatabaseConnection.setup
    end

    specify 'connection persists' do
      connection = DatabaseConnection.setup
      expect(DatabaseConnection.connection).to eq(connection)
    end
  end

  describe '.query' do
    it 'executes a SQL query string' do
      expect(DatabaseConnection.connection).to receive(:exec_params).with('SELECT * FROM bookmarks;', [])
      DatabaseConnection.query('SELECT * FROM bookmarks;')
    end
  end
end
