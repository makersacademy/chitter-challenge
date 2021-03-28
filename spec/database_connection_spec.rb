require 'database_connection.rb'

describe DatabaseConnection do 

  describe '.setup' do 
    it 'connects to a database' do 
      expect(PG).to receive(:connect).with(dbname: 'chitter_test').and_call_original
      DatabaseConnection.setup('chitter_test')
    end
  end 

  describe '.connection' do
    it 'shows the connection' do
      spider = DatabaseConnection.setup('chitter_test')  
      expect(DatabaseConnection.connection).to eq spider
    end 
  end 

  describe '.query' do
    it 'executes that SQL query on the database' do 
      DatabaseConnection.query("INSERT INTO peeps (content, name) VALUES('Test Peep', 'Tester') RETURNING id, content, name;") 
      test_peep = Peep.all.first
      expect(test_peep.id).to eq "1"
      expect(test_peep.content).to eq "Test Peep"
      expect(test_peep.name).to eq "Tester"
    end
  end
end 
