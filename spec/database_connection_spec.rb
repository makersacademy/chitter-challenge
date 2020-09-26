require 'database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it 'Connects to a database' do
      expect(PG).to receive(:connect).with(dbname: 'tweets')
      DatabaseConnection.setup('tweets')
      end
    end
  end
