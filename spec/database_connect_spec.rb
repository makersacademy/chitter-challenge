require 'database_connect'

describe ConnectDatabase do

  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      ConnectDatabase.setup('chitter_test')
    end

    it 'this connection is persistent' do
      connection = ConnectDatabase.setup('chitter_test')

      expect(ConnectDatabase.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = ConnectDatabase.setup('chitter_test')

      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")

      ConnectDatabase.query("SELECT * FROM peeps;")
    end
  end 

end
