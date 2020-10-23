require 'database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it 'Connects to a database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
      end
    end
    describe '#connection' do
      it 'Checks for persistent connection' do
        connection = DatabaseConnection.setup('chitter_test')
        expect(DatabaseConnection.connect).to eq connection
      end
    end


  describe '#query' do
    it 'Takes a SQL Query string and execute it' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec).with("SELECT * FROM messages")
      DatabaseConnection.query("SELECT * FROM messages")
    end
  end

  end
