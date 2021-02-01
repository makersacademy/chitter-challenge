require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'connects to a database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_manager_test')
      DatabaseConnection.setup('chitter_manager_test')
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('chitter_manager_test')
      expect(connection).to receive(:exec).with('SELECT * FROM users;')
      DatabaseConnection.query('SELECT * FROM users;')
    end
  end

end
