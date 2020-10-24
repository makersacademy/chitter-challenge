require 'database_connection'
require 'pg'

describe DatabaseConnection do
  describe '.setup' do
    it 'should connect to a database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_manager_test')
      DatabaseConnection.setup('chitter_manager_test')
    end

    it 'creates a persistent connection' do
      connection = DatabaseConnection.setup('chitter_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes SQL queries on the correct database' do
      connection = DatabaseConnection.setup('chitter_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")
      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end