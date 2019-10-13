def log_in(email = 'guy@mail.com', password = 'password')
  visit '/'
  click_link "Log In"
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button "Log In" 
end
