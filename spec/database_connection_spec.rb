require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_web_test')

      DatabaseConnection.setup(dbname: 'chitter_web_test')
    end
  end  
end
