def post_tweet
  visit '/'
  fill_in 'message', with: 'Test message'
  click_on 'Tweet'
  visit '/'
end

def sign_up
  visit 'sign_up'
  fill_in :email, with: 'testemail@hotmail.com'
  fill_in :password, with: 'testpassword'
  fill_in :confirmpassword, with: 'testpassword'
  click_button 'Sign up'
end
