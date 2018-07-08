require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to the database' do
      expect(PG).to receive(:connect).with(dbname: 'blabber_test')
      DatabaseConnection.setup('blabber_test')
    end
  end

  describe '.query' do
    it 'passes a query to PG' do
      connection = DatabaseConnection.setup('blabber_test')
      expect(connection).to receive(:exec).with("SELECT * FROM blabs;")
      DatabaseConnection.query("SELECT * FROM blabs;")
    end
  end
end
