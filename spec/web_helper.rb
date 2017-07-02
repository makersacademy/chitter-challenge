def post_tweet
  visit ('/')
  fill_in 'message', with: 'Test message'
  click_on 'Tweet'
  visit('/')
end
