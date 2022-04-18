require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end
    it 'this connection is persistant' do
      connection = DatabaseConnection.setup('chitter_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  # describe '.query' do
  #   it 'executes a query via PG' do
  #     connection = DatabaseConnection.setup('chitter_test')
  #     time1 = Time.new.strftime("%Y-%m-%d %H:%M:%S")
  #     peep1 = 'how are you'
  #     expect(connection).to receive(:exec_params).with("SELECT * FROM peeps")
  #     #expect(connection).to receive(:exec_params).with("INSERT INTO peeps (peep, time) VALUES($1, $2);, [peep1 , time1]")

  #   end
  # end
end