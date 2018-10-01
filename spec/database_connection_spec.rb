require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'peeps_test')
      DatabaseConnection.setup('peeps_test')
    end
  end

  it 'this connection is persistent' do
    # Grab the connection as a return value from the .setup method
    connection = DatabaseConnection.setup('peeps_test')
    expect(DatabaseConnection.connection).to eq connection
  end

  # describe '.query' do
  #   it 'tests a query' do
  #     self.query('SELECT * FROM peeps')
  #     DatabaseConnection.exec('SELECT * FROM peeps')
  #
  #   end
  # end

end
