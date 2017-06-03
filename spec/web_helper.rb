def sign_up(email: 'mail@marioribeiro.com',
            password: 'mypassword',
            username: 'marioribeiro')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Signup'
end