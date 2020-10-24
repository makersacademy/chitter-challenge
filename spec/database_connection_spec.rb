require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expext(PG).to receive(:connect).with(dbname: 'chitter_db_test')

      DatabaseConnection.setup('chitter_db_test')
    end
  end
end
