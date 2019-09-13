def log_in_test
  visit '/'
  fill_in 'Username', with: "Test987"
  fill_in 'Password', with: "password987"
  click_button "Log In"
  
end