require 'database_connection'

describe DatabaseConnection do
  let(:database) { 'chitter_manager_test' }
  let(:sql) { "SELECT table_name FROM information_schema.tables WHERE table_schema='public'" }

  describe '.setup' do
    it 'creates a PG connection object' do
      connection = DatabaseConnection.setup(database)

      expect(connection).to be_a PG::Connection
      expect(connection.db).to eq database
    end
  end

  describe '.connect' do
    it 'returns connection instance' do
      connection = DatabaseConnection.setup(database)

      expect(DatabaseConnection.connect).to eq connection
    end
  end

  describe '.execute' do
    it 'can execute a SQL statement' do
      DatabaseConnection.setup(database)

      expect(DatabaseConnection.connect).to receive(:exec).with(sql)
      DatabaseConnection.execute(sql)
    end

    it 'returns the result of a SQL statement' do
      DatabaseConnection.setup(database)
      result = DatabaseConnection.execute(sql)

      expect(result).to be_a PG::Result
      expect(result.fields.first).to eq 'table_name'
    end
  end
end
