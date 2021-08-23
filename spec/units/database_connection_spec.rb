require 'database_connection'

# thes tests aren't relevant until I change environment logic in peep.rb
describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup(dbname: 'chitter_test')
    end

    it 'this connection is persistent' do
      # Grab the connection as a return value from the .setup method
      connection = DatabaseConnection.setup(dbname: 'chitter_test')
      
      expect(DatabaseConnection.connection).to eq connection
    end
  end
end
