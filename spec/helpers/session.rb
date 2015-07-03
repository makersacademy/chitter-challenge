def sign_up(email: 'kirsten@jones.com', password: 'oranges!', username: 'kj', name: 'Kirsten Jones')
  visit '/users/new'
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :username, with: username
  fill_in :name,     with: name
  click_button 'Sign up'
end
