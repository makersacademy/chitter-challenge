def sign_up
  visit '/users/new'
  fill_in :email, with: 'no@email.com'
  fill_in :username, with: 'ainsleybc'
  fill_in :name, with: 'Ainsley Chang'
  fill_in :password, with: 'password'
  click_button 'Register'
end