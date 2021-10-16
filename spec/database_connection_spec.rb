require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database and saves it as an instance variable' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'executes an SQL query on the connected database using the PG gem' do
      connection = DatabaseConnection.setup('chitter_test')

      expect(connection).to receive(:exec_params).with("SELECT * FROM peeps;", [])
      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end
