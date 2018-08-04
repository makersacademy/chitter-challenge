require './lib/user_posts'

describe 'So that I can gather view all my posts' do
  it 'shows all my posts' do
    # establish the connection to the test database
    connection = PG.connect(dbname: 'user_tweets_test')

    # Adding the test data
    connection.exec("INSERT INTO tweet_info(content) VALUES('This is my first tweet');")
    connection.exec("INSERT INTO tweet_info(content) VALUES('This is my second tweet');")
    connection.exec("INSERT INTO tweet_info(content) VALUES('This is my one hundredth tweet');")

    # Visit the page
    expected_tweets = [
      'This is my first tweet',
      'This is my second tweet',
      'This is my one hundredth tweet'
    ]

    expect(User.all).to eq expected_tweets

  end
end
