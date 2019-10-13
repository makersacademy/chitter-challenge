def log_in(password='password')
  visit '/'
  click_link "Log In"
  fill_in "Chitter Handle", with: 'guy'
  fill_in "Password", with: password
  click_button "Log In" 
end
