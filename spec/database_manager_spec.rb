require 'database_manager'

describe DatabaseManager do
  describe '.setup' do
    it 'should be able to set up a database connection' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      described_class.setup('chitter_test')
    end
  end

  describe '.connection' do
    it 'can display its connection once set up' do
      expect(described_class.connection).to eq nil
      described_class.setup('chitter_test')
      expect(described_class.connection).to be_a PG::Connection
    end
  end

  describe '.query' do
    before do
      described_class.setup('chitter_test')
    end

    it 'can execute a query' do
      query = 'SELECT * FROM peeps'
      expect(described_class.connection).to receive(:exec).with query
      described_class.query(query)
    end
  end
end
