require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do 
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'Chitter_Manager_Test')

      DatabaseConnection.setup('Chitter_Manager_Test')
    end
    it 'connection is persistent' do
      connection = DatabaseConnection.setup('Chitter_Manager_Test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end
  describe '/query' do
    it 'executes query' do
      connection = DatabaseConnection.setup('Chitter_Manager_Test')
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")
      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end
