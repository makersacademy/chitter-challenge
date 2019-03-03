require 'db_connection'

describe DbConnection do
  describe '.setup' do
    it 'connects to database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DbConnection.setup('chitter_test')
    end

    it 'the connection is persistent' do
      connection = DbConnection.setup('chitter_test')
      expect(DbConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'can be used to query the db' do
      connection = DbConnection.setup('chitter_test')

      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")
      DbConnection.query("SELECT * FROM peeps;")
    end
  end
end
