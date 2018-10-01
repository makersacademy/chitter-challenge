def sign_in_and_tweet
  visit '/'
  fill_in 'tweet', with: "ahoy mateys, here's me 'ahoy world'!"
  click_on 'Arr, new tweet'
end