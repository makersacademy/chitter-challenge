require './lib/user_posts'

describe 'So that I can gather view all my posts' do
  it 'shows all my posts' do
    # establish the connection to the test database
    connection = PG.connect(dbname: 'user_tweets_test')

    # Adding the test data
    User.create_tweet(content: 'This is my first tweet')
    User.create_tweet(content: 'This is my second tweet')
    User.create_tweet(content: 'This is my fifteenth tweet')

    # Visit the page
    expected_tweets = [
      'This is my fifteenth tweet',
      'This is my second tweet',
      'This is my first tweet',
    ]
    
    expect(User.all).to eq expected_tweets
  end
end

describe '.create_tweet' do
  it 'creates a new post' do
    User.create_tweet(content: 'This is yet another post')
    expect(User.all).to include 'This is yet another post'
  end
end
