def post_test_tweets
  Tweet.post(tweet: 'test tweet 1')
  Tweet.post(tweet: 'test tweet 2')
  Tweet.post(tweet: 'test tweet 3')
end
