def sign_up
  visit('/')
  fill_in 'username', with: '@lewis'
  fill_in 'email', with: "lewis@gmail.com"
  fill_in 'password', with: "password"
  click_button 'Sign In'
end

def create_tweet
  visit('/tweets/new')
  fill_in 'subject', with: "What I'm doing"
  fill_in 'text', with: "Coding"
  click_button 'Tweet'
end
