require 'database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it 'sets up a connection to the database' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '#query' do
    it 'passes a query to PG' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM blabs;")
      DatabaseConnection.query("SELECT * FROM blabs;")
    end
  end
end
