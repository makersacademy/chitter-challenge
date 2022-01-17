require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'starts a new connection' do
      expect(ActiveRecord::Base).to receive(:establish_connection).with(
      adapter: 'postgresql',
      host: 'localhost',
      database: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end
end
