# ./spec/database_connection_spec.rb 

require 'database_connection'

describe DatabaseConnection do
  describe '.connect' do
    it 'connects to the database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      
      @connection = DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'sends the SQL query to the database' do
      connection = PG.connect(dbname: 'chitter_test')
      expect(connection).to receive(:exec_params).with("SELECT * FROM peeps", [])
      connection.exec_params(
        "SELECT * FROM peeps", []
      )
    end
  end
end