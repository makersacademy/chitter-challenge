def sign_up name, username, email
  visit '/users/new'
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: 'very hard to guess word'
  click_button 'Create account'
end

def sign_in username, password
  visit '/sessions/new'
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Sign in'
end

def post_peep text
  visit '/peeps/new'
  fill_in 'peep_content', with: text
  click_button 'Send'
end
