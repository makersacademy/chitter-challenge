def sign_up
  visit '/signup'
  fill_in :email, with: 'Email'
  fill_in :password, with: 'Password'
  fill_in :name, with: 'Name'
  fill_in :username, with: 'Username'
  click_button 'Register'
end
