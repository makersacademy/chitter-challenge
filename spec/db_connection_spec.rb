require 'db_connection'

describe DBConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_db_test')

      DBConnection.setup('chitter_db_test')
    end

    it 'this connection is persistent' do
      connection = DBConnection.setup('chitter_db_test')
      expect(DBConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DBConnection.setup('chitter_db_test')
      expect(connection).to receive(:exec).with("SELECT * FROM chitter;")
      DBConnection.query("SELECT * FROM chitter;")
    end
  end
end
