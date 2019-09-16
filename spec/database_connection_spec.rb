require 'database_connection'

describe DatabaseConnection do
  describe '.set_up' do
    it 'sets up a database connection' do
      expect(PG).to receive(:connect).with(dbname: 'honker_test')
      DatabaseConnection.set_up('honker_test')
    end
  end

  describe '.query' do
    it 'executes a query on a database connection' do
      connection = DatabaseConnection.set_up('honker_test')
  
      expect(connection).to receive(:exec).with("SELECT * FROM honks;")
      DatabaseConnection.query("SELECT * FROM honks;")
    end
  end
end
