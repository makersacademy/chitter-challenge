require 'database_manager'

describe DatabaseManager do
  let(:fake_connection) { double(:connection_double, :exec_params => true) }
  let(:fake_pg) { double(:pg_double, :connect => fake_connection) }

  describe '.setup' do
    it 'connects to a specified database via PG' do
      expect(fake_pg).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseManager.setup(fake_pg)
    end
  end

  context 'once .setup has run' do
    before do
      DatabaseManager.setup(fake_pg)
    end
  
    describe '.connection' do
      it 'returns the connection to the database' do
        expect(DatabaseManager.connection).to eq fake_connection
      end
    end

    describe '.query' do
      it 'sends a query to the connected database' do
        DatabaseManager.query
        expect(fake_connection).to have_received(:exec_params).with("SELECT * FROM peeps", [])
      end
    end
  end
end
