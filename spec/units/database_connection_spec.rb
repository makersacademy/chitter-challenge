require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'connects to a database' do
      expect(PG).to receive(:connect).with(dbname: 'peeps_manager_test')
      DatabaseConnection.setup('peeps_manager_test')
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('peeps_manager_test')
      expect(connection).to receive(:exec).with('SELECT * FROM peeps;')
      DatabaseConnection.query('SELECT * FROM peeps;')
    end
  end

end
