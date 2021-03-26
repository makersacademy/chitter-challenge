require 'db_connection'

describe DbConnection do
  describe '#setup' do
    it 'sets up the database connection to the specified database' do
      expect(PG).to receive(:connect).with(:dbname => 'chitter_test')
      DbConnection.setup('chitter_test')
    end
  end

  describe '#query' do
    it 'takes a string and actions it on the current server' do
      DbConnection.setup('chitter_test')
      expect(DbConnection.connected).to receive(:exec).with("SELECT * FROM peeps")
      DbConnection.query("SELECT * FROM peeps")
    end
  end
end
