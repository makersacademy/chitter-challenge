require 'database_connection'

RSpec.describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'sends the SQL query to the database' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with "DROP TABLE IF EXISTS foobar"
      DatabaseConnection.query("DROP TABLE IF EXISTS foobar")
    end
  end
end
