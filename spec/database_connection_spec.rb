require_relative '../lib/database_connection'

describe DatabaseConnection do
  context '#setup' do
    it 'sets up a connection to a specified database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_manager_test')

      DatabaseConnection.setup('chitter_manager_test')
    end
  end

  context '#query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('chitter_manager_test')

      expect(connection).to receive(:exec_params).with("SELECT * FROM messages;", [])
      DatabaseConnection.query("SELECT * FROM messages;")
    end
  end
end