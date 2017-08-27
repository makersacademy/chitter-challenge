def post_tweet
  visit "/feed"
  fill_in :tweet, with: "Hello World"
  click_button "Tweet!"
end
