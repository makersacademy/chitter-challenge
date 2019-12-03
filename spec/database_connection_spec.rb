require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'it connects to the database and saves the connection as an instance variable' do
      expect(PG).to receive(:connect).with(dbname: 'peeps_test')
      DatabaseConnection.setup(dbname: 'peeps_test')
    end
  end
end
