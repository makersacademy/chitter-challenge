require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    
    it 'sets up a connection to the database through pg' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end

    it 'this connection is persistent' do
      # Grab the connection as a return value from the .setup method
      connection = DatabaseConnection.setup('bookmark_manager_test')
    
      expect(DatabaseConnection.connection).to eq connection
    end

  end
end