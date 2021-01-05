require 'pg'

describe Tweet do

  describe ".add_tweet" do
    it "fails because the username does not exist" do
      is_inserted = Tweet.add(username: 'this_username_does_not_exist', message: 'This is my first tweet')
      expect(is_inserted).to be false
    end
  end

  describe ".display_tweets" do
    it "shows tweets" do
      username = 'test_user'
      tweet_message = 'This is my first tweet'
      connection = PG.connect(dbname: 'chitter_test')
      connection.prepare("insert_new_test_user", "INSERT INTO users (username, email, first_name, last_name, password) VALUES ($1, $2, $3, $4, $5);")
      connection.exec_prepared("insert_new_test_user", [username, 'testuser@acme.inc', 'John', 'Doe', 'loremipsum'])
      is_inserted = Tweet.add(username: username, message: tweet_message)
      expect(is_inserted).to be true
      tweets = Tweet.display
      expect(tweets.length).to eq 1
      tweet = tweets[0]
      expect(tweet.username).to eq username
      expect(tweet.message).to eq tweet_message
    end
  end

end
