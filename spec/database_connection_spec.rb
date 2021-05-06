require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database' do
      expect(PG).to receive(:connect).with(dbname: 'peep_manager_test')

      DatabaseConnection.setup('peep_manager_test')
    end
  end

  describe '.query' do
    it 'executes a query' do
      connection = DatabaseConnection.setup('peep_manager_test')

      expect(connection).to receive(:exec).with('SELECT * FROM users;')

      DatabaseConnection.query('SELECT * FROM users;')
    end
  end
end
