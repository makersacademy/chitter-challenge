# require 'database_connection'
require_relative '../database_connection_setup.rb'

describe DatabaseConnection do

  describe '.setup' do
    it 'sets up database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.connection' do
    it 'returns correct connection' do
      example = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq example
    end
  end

  describe '.query' do
    it 'accepts a query string' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")

      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
  
end
