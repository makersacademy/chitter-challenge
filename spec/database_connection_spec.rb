require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up database connection via PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end

    it 'connection is persistent' do
      connection = DatabaseConnection.setup('chitter_test')
    
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes query via PG' do
      connection = DatabaseConnection.setup('chitter_test')
  
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")
  
      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end

end
