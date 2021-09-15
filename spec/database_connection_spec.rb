require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
        expect(PG).to receive(:connect).with(dbname: 'chitter_machine_test')
        DatabaseConnection.setup('chitter_machine_test')
    end
    
    it 'this connection is persistent' do
        # Grab the connection as a return value from the .setup method
        connection = DatabaseConnection.setup('chitter_machine_test')      
        expect(DatabaseConnection.connection).to eq connection
    end
  
end

