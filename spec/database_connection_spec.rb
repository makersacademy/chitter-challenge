require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec_params).with("SELECT * FROM chitter;", [])
      DatabaseConnection.query("SELECT * FROM chitter;")
    end
  end
end
