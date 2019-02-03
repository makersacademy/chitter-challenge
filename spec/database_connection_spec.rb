require './app/lib/database_connection'

RSpec.describe DatabaseConnection do
  describe '.setup' do
    it 'sets up the db connection via PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.connection' do
    it 'sets up a persistent connection' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq(connection)
    end
  end

  describe '.query' do
    it 'enables interacting with the database' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")
      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end