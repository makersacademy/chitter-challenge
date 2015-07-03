def sign_up(email: 'kirsten@jones.com', password: 'oranges!')
  visit '/users/new'
  fill_in :email,    with: email
  fill_in :password, with: password
  click_button 'Sign up'
end
