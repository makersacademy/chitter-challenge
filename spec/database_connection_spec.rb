require_relative '../lib/database_connection'

describe DatabaseConnection do
  context '#setup' do
    it 'sets up a connection to a specified database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_manager_test')

      DatabaseConnection.setup('chitter_manager_test')
    end
  end
end