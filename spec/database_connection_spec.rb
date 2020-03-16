require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'sets up a connection to the database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end
    # it 'this connection is persistent' do
    #   # grab the connection as a return value from the setup method
    #   connection = DatabaseConnection.setup('chitter_test')
    #
    #   expect(DatabaseConnection.connection).to eq connection
    # end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('chitter_test')

      expect(connection).to receive(:exec).with("SELECT * FROM users;")

      DatabaseConnection.query("SELECT * FROM users;")
    end
  end
end
