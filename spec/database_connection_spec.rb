require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'Connects to test PG database' do
      conn = DatabaseConnection.setup('chitter_test')
      expect(conn.connection).to eq conn
    end
  end
end
