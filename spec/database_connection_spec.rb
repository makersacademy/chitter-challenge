require './lib/database_connection'

RSpec.describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter')

      DatabaseConnection.setup('chitter')
    end
  end
end
