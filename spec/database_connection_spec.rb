require 'database_connection'

describe DatabaseConnection do 
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
  
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'executes an SQL statement given as an argument' do
      connection = described_class.setup('chitter_test')
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks")

      DatabaseConnection.query("SELECT * FROM bookmarks")     
    end
  end
end
