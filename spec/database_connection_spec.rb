require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up connection to database using PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'executes SQL query on connection' do
      DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to receive(:exec).with("sql string")
      DatabaseConnection.query("sql string")
    end
  end
end
