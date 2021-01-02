require 'database_connection'
require 'pg'
describe 'DatabaseConnection' do
  let(:connection) { double :PG }
  describe '.setup' do
    it "sets up connection to the database" do
      allow(connection).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe ".exec_prepared" do  
    it "executes a prepared statement" do
      params = []
      allow(connection).to receive(:connect).with(dbname: 'chitter_test')
      allow(connection).to receive(:prepare).with('list_tweets', 'query')
      DatabaseConnection.exec_prepared('list_tweets', params)
    end
  end

end
