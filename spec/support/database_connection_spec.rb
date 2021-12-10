require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up connection to database' do
      expect(PG).to receive(:connect).with({ dbname: 'bookmark_manager_test' })
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
