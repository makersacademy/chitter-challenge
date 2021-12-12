require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up connection to test database' do
      expect(PG).to receive(:connect).with({ dbname: 'chitter_test' })
      DatabaseConnection.setup
    end

    specify 'connection persists' do
      connection = DatabaseConnection.setup
      expect(DatabaseConnection.connection).to eq(connection)
    end
  end

  describe '.query' do
    it 'executes a SQL query string' do
      expect_any_instance_of(PG::Connection).to receive(:exec_params).with('SELECT * FROM messages;', [])
      DatabaseConnection.query('SELECT * FROM messages;')
    end
  end
end
