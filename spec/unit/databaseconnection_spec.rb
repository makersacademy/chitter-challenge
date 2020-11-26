require './lib/databaseconnection'

describe DatabaseConnection do

  describe '.setup' do
    it 'connects to the database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end
  
  describe '.query' do
    it 'uses PG to create and SQL query' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")
      DatabaseConnection.query("SELECT * FROM peeps;")
    end  
  end

  describe '.connection' do
    it 'connection is persisted' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq(connection)
    end
  end
end
