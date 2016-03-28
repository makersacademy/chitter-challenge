def sign_up(first_name: 'Annemarie', last_name: 'Kohler', username: 'Anne',
  email: 'anne@chittr.com', password: 'dog', password_confirmation: 'dog')
  visit '/users/new'
  fill_in :first_name, with: first_name
  fill_in :last_name, with: last_name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email: 'anne@chittr.com', password: 'dog')
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log in'
end

def peep
  sign_in
  fill_in :body, with: 'Hi my name is.. Please stand up!'
  click_button 'Peep it'
end
