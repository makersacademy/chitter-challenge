require 'database_connection'

describe DatabaseConnection do
  let(:test_db_name) { 'chitter_test' }
  describe '.connect' do
    it "connects to the database" do
      connection = described_class.connect(test_db_name)
      expect(connection.db).to eq test_db_name
    end
  end

  describe '.query' do
    it 'passes the query to the database' do
      connection = described_class.connect(test_db_name)
      test_query = 'test_query'
      expect(connection).to receive(:exec).with(test_query)
      described_class.query(test_query)
    end
  end

  describe ".connection" do
    it "returns the current connection" do
      connection = described_class.connect(test_db_name)
      expect(described_class.connection).to eq connection
    end
  end
end
