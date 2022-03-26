require './app/database_connection'

describe DatabaseConnection do
  describe '#.setup_db' do
    it 'sets the connection to a database with PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_app_test')

      DatabaseConnection.setup_db('chitter_app_test')
    end
  end

  describe '#query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup_db('chitter_app_test')

      expect(connection).to receive(:exec_params).with("SELECT * FROM chitter;", [])

      DatabaseConnection.query("SELECT * FROM chitter;")
    end
  end
end