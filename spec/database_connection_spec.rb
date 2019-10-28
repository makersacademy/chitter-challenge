# frozen_string_literal: true

require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a databasethrough PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      described_class.setup(dbname: 'chitter_test')
    end

    it 'this connection is persistent' do
      connection = described_class.setup(dbname: 'chitter_test')

      expect(described_class.connection).to eq connection
    end
  end
  describe '.query' do
    it 'executes a query via PG' do
      connection = described_class.setup(dbname: 'chitter_test')

      expect(connection).to receive(:exec).with('SELECT * FROM users;')

      described_class.query('SELECT * FROM users;')
    end
  end
end
