require 'database_connection'
require 'pg'

describe DatabaseConnection do

  let(:subject) { DatabaseConnection}
  
  describe "#setup" do
    it "takes a database and connects" do
      expect(subject.setup('chitter_test')).is_a?(PG)
    end

    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end
  end

  describe "#connection" do
    it 'is the same connection' do
        connection = DatabaseConnection.setup('chitter_test')
      
        expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('chitter_test')
  
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")
  
      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
  
end