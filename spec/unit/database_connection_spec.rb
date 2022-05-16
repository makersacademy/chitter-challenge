require 'database_connection'

describe 'database connection' do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter')

      DatabaseConnection.setup('chitter')
    end
  end
  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('chitter')
  
      expect(connection).to receive(:exec_params).with("SELECT * FROM bookmarks;", [])
  
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end