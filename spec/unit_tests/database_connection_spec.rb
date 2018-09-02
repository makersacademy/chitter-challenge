require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'connects to a database' do
      database = 'chitter_manager_test'
      expect(described_class.setup(database).db).to eq database
    end
  end
  describe '.query' do
    it 'sends a query to a database' do
      query = "SELECT * FROM peeps"
      expect(described_class.query(query).fields).to eq ["id", "comment", "user_id", "time"]
    end
  end
  describe '.connection' do
    it 'keeps the connection' do
      con = described_class.setup
      expect(described_class.connection).to eq con
    end
  end
end
