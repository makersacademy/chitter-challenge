require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'setups a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'Chitter_Test')

      DatabaseConnection.setup(dbname: 'Chitter_Test')
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
       connection = DatabaseConnection.setup(dbname: 'Chitter_Test')

       expect(connection).to receive(:exec).with("SELECT * FROM peep ORDER BY timestamp DESC;")

       DatabaseConnection.query("SELECT * FROM peep ORDER BY timestamp DESC;")
    end
  end
end
