# frozen_string_literal: true

require 'database_connection'

RSpec.describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database though pg' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      described_class.setup('chitter_test')
    end

    it 'has a connection that is persistant' do
      connection = described_class.setup('chitter_test')

      expect(described_class.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = described_class.setup('chitter_test')

      expect(connection).to receive(:exec_params).with("SELECT * FROM peeps;", [])

      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end
