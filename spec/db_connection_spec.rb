require 'db_connection'

describe DbConnection do

  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DbConnection.setup('chitter_test')
    end

    it 'this connection stays conencted' do
      connection = DbConnection.setup('chitter_test')
    
      expect(DbConnection.connection).to eq connection
    end
  end
end
