def log_in(email: 'tim@gmail.com', password: 'kiwi')
  visit '/session/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log in'
end
