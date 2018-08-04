require './lib/database_connection'

RSpec.describe Database_connection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'user_tweets_test')
      Database_connection.setup('user_tweets_test')
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = Database_connection.setup('user_tweets_test')
      expect(connection).to receive(:exec).with("SELECT * FROM tweet_info;")
      Database_connection.query("SELECT * FROM tweet_info;")
    end
  end
end
