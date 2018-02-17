require 'database_connection'

describe DatabaseConnection do

  describe '::setup' do
    it 'sets up a connection to specified database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      described_class.setup('chitter_test')
    end
  end

  describe '::query' do
    it 'executes an SQL query on the correct database' do
      connection = described_class.setup('chitter_test')
      expect(connection).to receive(:exec).with('SELECT * FROM peeps')
      described_class.query('SELECT * FROM peeps')
    end
  end

end
