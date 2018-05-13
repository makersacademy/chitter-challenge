require './app/lib/database_connector'

describe DatabaseConnector do
  describe '#db_connection' do
    it 'responds to #db_connection' do
      expect(described_class).to respond_to :db_connection
    end

    it 'sends #connect to PG' do
      expect(PG).to receive(:connect)
      described_class.db_connection
    end
  end
end