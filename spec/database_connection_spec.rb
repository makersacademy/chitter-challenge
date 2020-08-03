require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'Connects to test PG database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'Executes an SQL command via PG' do
      conn = DatabaseConnection.setup('chitter_test')
      expect(conn).to receive(:exec).with('SELECT * FROM peeps;')
      DatabaseConnection.query('SELECT * FROM peeps;')
    end
  end
end
