
def visit_homepage
  visit('/cheets')
end

def visit_login
  visit('/login')
end

def no_email_signup
  visit_login
  fill_in('password', with: 'makers18')
  click_button('Signup')
end

def no_password_signup
  visit_login
  fill_in('email', with: 'tester@makers.com')
  click_button('Signup')
end

def successful_login
  visit_login
  fill_in('email', with: 'tester@gmail.com')
  fill_in('password', with: 'testpassword')
  click_button('Signup')
end

def add_successful_tweet
  fill_in('content', with: "welcome to chitter")
  click_button('Submit')
end

def tweet_too_long
  long_tweet = "Twitter doubled the character limit of tweets to 280 in a surprise move yesterday, but not every Twitter user will be able to use the new limit just yet. Twitter is rolling out the long tweets feature to select accounts as a test, but Twitter user Prof9 has discovered a workaround to get longer tweets a little early. Here’s how to tweet with 280 characters instead of 140:"

  fill_in('content', with: long_tweet)
  click_button('Submit')
end

def tweet_too_short
  click_button('Submit')
end
