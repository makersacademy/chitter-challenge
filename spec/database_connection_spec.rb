require 'database_connection'

describe DatabaseConnection do 
  let(:connection) { DatabaseConnection.setup('twitter_test') }
  describe '.setup' do 
    it 'should set up a database connection' do
      expect(PG).to receive(:connect).with(dbname: 'twitter_test')
      DatabaseConnection.setup('twitter_test')
    end 
  end 

  describe 'connection' do 
    it 'should know connection' do 
      expect(connection).to eq connection
    end 
  end 

  describe '.query' do 
    it 'should receive a query' do
      expect(connection).to receive(:exec).with('SELECT * FROM tweets')
      DatabaseConnection.query('SELECT * FROM tweets')
    end 
  end 
end 
