def sign_up(email: 'kirsten@jones.com', password: 'oranges!', username: 'kj', name: 'Kirsten Jones')
  visit '/users/new'
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :username, with: username
  fill_in :name,     with: name
  click_button 'Sign up'
end

def sign_in(username: 'kj', password: 'oranges!')
  visit '/sessions/new'
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Sign in'
end
