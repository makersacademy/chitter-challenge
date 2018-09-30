def log_in_as_billy
  visit '/'
  fill_in 'username', with: 'billy1'
  fill_in 'password', with: 'password'
  click_button 'Log in'
end

def sign_up_for_chitter(name, username, email, password)
  visit '/'
  click_link 'Sign up for Chitter!'
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Sign up'
end

def retrieve_settings
  Capybara.app.settings
end

def log_out_of_page
  visit '/'
  click_button 'Log out'
end
