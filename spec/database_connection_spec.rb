require 'database_connection'

describe DatabaseConnection do
  describe '#self.setup' do
    it 'sets up database connection with PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '#self.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with('SELECT * FROM peeps;')
      expect(connection).to receive(:exec).with('SELECT * FROM account;')
      DatabaseConnection.query('SELECT * FROM peeps;')
      DatabaseConnection.query('SELECT * FROM account;')
    end
  end
end
