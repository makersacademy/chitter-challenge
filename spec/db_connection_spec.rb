require 'db_connection'

describe DatabaseConnection do
  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('chitter_test')

      expect(connection).to receive(:exec_params).with("SELECT * FROM peeps;",[])
      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end