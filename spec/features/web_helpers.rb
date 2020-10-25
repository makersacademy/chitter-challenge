def log_in
  visit('/')
  click_button('Log In')
  fill_in "email",	with: "kiriarf@chitter.com"
  fill_in "password",	with: "123"
  click_button('Log In')
end