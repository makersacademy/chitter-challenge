require 'database_connection'

RSpec.describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      described_class.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'sends the SQL query to the database' do
      connection = described_class.setup('chitter_test')
      expect(connection).to receive(:exec).with "DROP TABLE IF EXISTS foobar"
      described_class.query("DROP TABLE IF EXISTS foobar")
    end
  end

  describe '.connection' do
    it 'returns the current database connection' do
      connection = described_class.setup('chitter_test')
      expect(described_class.connection).to eq connection
    end
  end
end
