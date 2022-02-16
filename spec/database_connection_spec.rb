require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('chitter_test')

      expect(connection).to receive(:exec_params).with("SELECT * FROM peeps;",[])

      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end

  describe '.escape_string' do
    it 'escapes a string which has quotes contained in the string' do
      connection = DatabaseConnection.setup('chitter_test')
      test_data = "string with a single quote ' in it"
      
      expect( DatabaseConnection.escape_string(test_data) ).to eq "string with a single quote '' in it"
    end
  end

end


